# from repositories import DataRepository
# from repositories.DataRepository import DataRepository
from flask import Flask, jsonify
from flask_socketio import SocketIO
from flask_cors import CORS
import os
import glob
import time
from datetime import datetime


os.system('modprobe w1-gpio')
os.system('modprobe w1-therm')

base_dir = '/sys/bus/w1/devices/'
device_folder = glob.glob(base_dir + '28*')[0]
device_file = device_folder + '/w1_slave'

app = Flask(__name__)
app.config['SECRET_KEY'] = 'Hier mag je om het even wat schrijven, zolang het maar geheim blijft en een string is'

socketio = SocketIO(app, cors_allowed_origins="*")
CORS(app)


def read_temp_raw():
    f = open(device_file, 'r')
    lines = f.readlines()
    f.close()
    return lines


def read_temp():
    lines = read_temp_raw()
    while lines[0].strip()[-3:] != 'YES':
        time.sleep(0.2)
        lines = read_temp_raw()
    equals_pos = lines[1].find('t=')
    if equals_pos != -1:
        temp_string = lines[1][equals_pos+2:]
        temp_c = float(temp_string) / 1000.0
        timestamp = datetime.now()
        eenheid = "graden Celsius"
        sensor_id = 2
        voedingsbak_id1 = 1

        # DataRepository.create_nieuwe_meting_voedingsbak_id(
        #     temp_c, eenheid, timestamp, sensor_id, voedingsbak_id1)
        # test = DataRepository.read_waarde_temp()
        # print(test['waarde'])
    return temp_c


print(read_temp())


@socketio.on("F2B_ShowData")
def ShowData(data):
    print(data['value'])
    value = read_temp()
    print(value)
    socketio.emit("B2F_temperature", value)


if __name__ == '__main__':
    socketio.run(app, debug=False, host='0.0.0.0')
