# pylint: skip-file
# from repositories import DataRepository
# from repositories.DataRepository import DataRepository
from flask import Flask, jsonify
from flask_socketio import SocketIO
from flask_cors import CORS
import RPi.GPIO as GPIO
import time
from datetime import datetime
import threading

GPIO.setmode(GPIO.BOARD)
PIN_WATER = 32
GPIO.setup(PIN_WATER, GPIO.IN)
GPIO.setwarnings(False)

app = Flask(__name__)
app.config['SECRET_KEY'] = 'Hier mag je om het even wat schrijven, zolang het maar geheim blijft en een string is'

socketio = SocketIO(app, cors_allowed_origins="*")
CORS(app)

# API ENDPOINTS


@app.route('/')
def hallo():
    return "Server is running, er zijn momenteel geen API endpoints beschikbaar."


# SOCKET IO
# @socketio.on('connect')
# def initial_connection():
#     print('A new client connect')
#     # # Send to the client!
#     # vraag de status op van de lampen uit de DB
#     status = DataRepository.read_status_lampen()
#     socketio.emit('B2F_status_lampen', {'lampen': status})
#     socketio.emit()

# @socketio.on('F2B_switch_light')
# def switch_light(data):
#     print('licht gaat aan/uit')
#     lamp_id = data['lamp_id']
#     new_status = data['new_status']
#     # spreek de hardware aan
#     # stel de status in op de DB
#     res = DataRepository.update_status_lamp(lamp_id, new_status)
#     print(lamp_id)
#     if lamp_id == "2":
#         lees_knop(20)
#     # vraag de (nieuwe) status op van de lamp
#     data = DataRepository.read_status_lamp_by_id(lamp_id)
#     socketio.emit('B2F_verandering_lamp', {'lamp': data})
print("Start sensor...")
time.sleep(2)
print("Sensor activated...")


while True:

    if GPIO.input(PIN_WATER) == 1:
        print("Water detected! " + (time.strftime("%H:%M:%S")))
        break

    elif GPIO.input(PIN_WATER) == 0:
        print("No water detected")
        break

    time.sleep(0.1)


if __name__ == '__main__':
    socketio.run(app, debug=False, host='0.0.0.0')
