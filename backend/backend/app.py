# pylint: skip-file
# from repositories import DataRepository
# import temperatuursensor
from repositories.DataRepository import DataRepository
import repositories
from flask import Flask, jsonify
from flask_socketio import SocketIO
from flask_cors import CORS
import RPi.GPIO as GPIO
from repositories import I2C_LCD_driver
import time
import threading
import socket
from repositories.hx711 import HX711
# from repositories import temperatuursensor
import subprocess
from subprocess import Popen
import repositories.example_python3
# from hx711py import example_python3
# from time import *
# from time import time
from datetime import datetime
import threading
# from temperatuursensor import read_temp
import sys
import os
import glob
import LCD
# LCD.setuplcd()


GPIO.cleanup()
GPIO.setwarnings(False)
GPIO.setmode(GPIO.BCM)
PIN_PIR = 25
PIN_WATER = 12
pin_voedingsbak_eten = [29, 31]

GPIO.setwarnings(False)
GPIO.setup(PIN_WATER, GPIO.IN)
GPIO.setup(PIN_PIR, GPIO.IN)
GPIO.setup(5, GPIO.OUT)
GPIO.setup(18, GPIO.OUT)
servo1 = GPIO.PWM(5, 50)
servo1.start(0)

os.system('modprobe w1-gpio')
os.system('modprobe w1-therm')

base_dir = '/sys/bus/w1/devices/'
device_folder = glob.glob(base_dir + '28*')[0]
device_file = device_folder + '/w1_slave'


app = Flask(__name__)
app.config['SECRET_KEY'] = 'Hier mag je om het even wat schrijven, zolang het maar geheim blijft en een string is'

socketio = SocketIO(app, cors_allowed_origins="*")
CORS(app)


def get_ip_address():
    ip_address = ''
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    s.connect(("8.8.8.8", 80))
    ip_address = s.getsockname()[0]
    s.close()
    return ip_address


def LCDdisp():
    ip_address = ''
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    s.connect(("8.8.8.8", 80))
    ip_address = s.getsockname()[0]
    s.close()

    LCD.setuplcd()
    LCD.lcd_string(f"PetFret", LCD.LCD_LINE_1)
    LCD.lcd_string(f"{ip_address}", LCD.LCD_LINE_2)


LCDdisp()
# LCDstart = threading.Thread(target=LCDdisp)
# LCDstart.start()


# API ENDPOINTS


@app.route('/')
def hallo():
    return "Server is running, er zijn momenteel geen API endpoints beschikbaar."


# SOCKET IO


@socketio.on('connect')
def initial_connection():
    # objectje = DataRepository.read_waarde_beweging()
    # data = objectje['waarde']
    # socketio.emit("B2F_data_ontvangen", data)
    # print("test123")
    print('A new client connect')
    # # Send to the client!
    # vraag de status op van de lampen uit de DB

    socketio.emit('B2F_connected', {'currentProgress': 0})


# def watersupply():
#     while True:
#         hx_1 = HX711(6, 13)
#         hx_1.set_offset(8728557.0625)
#         hx_1.set_scale(392.126)
#         val1 = hx_1.get_grams()
#         print(val1)
#         hx_1.power_down()
#         if val1 < 0:
#             val1 = 0
#         if 0 <= val1 <= 10:
#             print("Te weinig water")
#             GPIO.output(18, GPIO.LOW)
#             time.sleep(20)
#             GPIO.output(18, GPIO.HIGH)
#         elif val1 > 10:
#             GPIO.output(18, GPIO.HIGH)


# watersupply = threading.Thread(target=watersupply)
# watersupply.start()


def pir():
    while True:

        if GPIO.input(PIN_PIR):

            def addMovement():
                print("Movement detected! " + (time.strftime("%H:%M:%S")))

                timestamp = datetime.now()
                waarde = 1
                eenheid = "bool"
                id = 1
                DataRepository.create_nieuwe_meting_beweging(
                    waarde, eenheid, timestamp, id)

            # test = DataRepository.read_waarde_beweging()
            # # threading.Timer(0.2, addMovement).start()

            def addWaterniveau():
                timestamp = datetime.now()
                eenheid = "bool"
                if GPIO.input(PIN_WATER) == 1:
                    print("Water detected! " + (time.strftime("%H:%M:%S")))
                    waarde = 1
                    id = 3
                    value = "enough"
                    DataRepository.create_nieuwe_meting_waterniveau(
                        waarde, eenheid, timestamp, id)
                    # socketio.emit("B2FB2F_waterniveau", value)

                elif GPIO.input(PIN_WATER) == 0:
                    print("No water detected")
                    waarde = 0
                    id = 3
                    value = "not enough"
                    DataRepository.create_nieuwe_meting_waterniveau(
                        waarde, eenheid, timestamp, id)
                #     socketio.emit("B2FB2F_waterniveau", value)
                # # threading.Timer(1, addMovement).start()

            def addTemperatuur():
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
                    print(temp_c)
                    timestamp = datetime.now()
                    waarde = temp_c
                    eenheid = "graden Celsius"
                    id = 2
                    DataRepository.create_nieuwe_meting_beweging(
                        waarde, eenheid, timestamp, id)

                read_temp()

            def addGewichtEetbak():
                hx_trans = HX711(17, 27)
                hx_1 = HX711(6, 13)
                hx_2 = HX711(19, 26)

                def cleanAndExit():
                    GPIO.cleanup()

                def setup():
                    hx_trans.set_offset(8775534.8125)
                    hx_trans.set_scale(431.801)

                def setup1():
                    hx_1.set_offset(8728557.0625)
                    hx_1.set_scale(392.126)

                def setup2():
                    hx_2.set_offset(8375759.375)
                    hx_2.set_scale(405.293)

                def loop():
                    val = hx_trans.get_grams()

                    hx_trans.power_down()
                    time.sleep(.001)
                    hx_trans.power_up()

                    time.sleep(0.001)
                    timestamp = datetime.now()
                    waarde = val
                    if waarde < 0:
                        waarde = 0
                    eenheid = "gram"
                    id = 4
                    DataRepository.create_nieuwe_meting_beweging(
                        waarde, eenheid, timestamp, id)
                    return val

                def loop1():

                    val1 = hx_1.get_grams()

                    hx_1.power_down()
                    time.sleep(.001)
                    hx_1.power_up()

                    time.sleep(0.001)
                    timestamp = datetime.now()
                    waarde = val1
                    eenheid = "gram"
                    id = 5
                    DataRepository.create_nieuwe_meting_beweging(
                        waarde, eenheid, timestamp, id)
                    return val1

                def loop2():

                    val2 = hx_2.get_grams()

                    hx_2.power_down()
                    time.sleep(.001)
                    hx_2.power_up()

                    time.sleep(0.001)
                    timestamp = datetime.now()
                    waarde = val2+17
                    eenheid = "gram"
                    id = 6
                    DataRepository.create_nieuwe_meting_beweging(
                        waarde, eenheid, timestamp, id)
                    return waarde

                setup()
                print(loop())
                setup1()
                print(loop1())
                setup2()
                print(loop2())

            def watersupply():
                hx_1 = HX711(6, 13)
                hx_1.set_offset(8728557.0625)
                hx_1.set_scale(392.126)
                val1 = hx_1.get_grams()
                print(val1)
                hx_1.power_down()
                if val1 < 0:
                    val1 = 0
                if 0 <= val1 <= 50:
                    print("Te weinig water")
                    GPIO.output(18, GPIO.LOW)
                    time.sleep(60)
                    GPIO.output(18, GPIO.HIGH)
                elif val1 > 10:
                    print("genoeg water")
                    GPIO.output(18, GPIO.HIGH)
            time.sleep(10)
            addMovement()
            addWaterniveau()
            watersupply()
            addGewichtEetbak()
            addTemperatuur()

            time.sleep(300)


second_process = threading.Thread(target=pir)
second_process.start()


@ socketio.on("F2B_test")
def read_test(data):
    # array = DataRepository.read_data_chart()

    # arrayHoev = []
    # arrayDag = []

    # for diction in array:
    #     arrayHoev.append(diction["hoeveel"])
    #     arrayDag.append(diction["dag"])
    # arraytotaal = [arrayHoev, arrayDag]
    # socketio.emit("B2F_volledige_data_sturen", arraytotaal)

    print(data["value"])
    timestamp = datetime.now()
    eenheid = "bool"
    if GPIO.input(PIN_WATER) == 1:
        print("Water detected! " + (time.strftime("%H:%M:%S")))
        waarde = 1
        id = 3
        value = "enough"
        DataRepository.create_nieuwe_meting_waterniveau(
            waarde, eenheid, timestamp, id)
        socketio.emit("B2F_waterniveau", value)

    elif GPIO.input(PIN_WATER) == 0:
        print("No water detected")
        waarde = 0
        id = 3
        value = "not enough"
        DataRepository.create_nieuwe_meting_waterniveau(
            waarde, eenheid, timestamp, id)
        socketio.emit("B2F_waterniveau", value)

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
        print(temp_c)
        timestamp = datetime.now()
        waarde = int(temp_c)
        eenheid = "graden Celsius"
        id = 2
        DataRepository.create_nieuwe_meting_beweging(
            waarde, eenheid, timestamp, id)
        socketio.emit("B2F_temperature", waarde)
    read_temp()

    hx_trans = HX711(17, 27)
    hx_1 = HX711(6, 13)
    hx_2 = HX711(19, 26)

    def cleanAndExit():
        GPIO.cleanup()

    def setup():
        hx_trans.set_offset(8775534.8125)
        hx_trans.set_scale(431.801)

    def setup1():
        hx_1.set_offset(8728557.0625)
        hx_1.set_scale(392.126)

    def setup2():

        hx_2.set_offset(8377960.0625)
        hx_2.set_scale(405.833)

    def loop():
        val = hx_trans.get_grams()

        hx_trans.power_down()
        # time.sleep(.001)
        # hx_trans.power_up()

        time.sleep(0.001)
        timestamp = datetime.now()
        waarde = val
        eenheid = "gram"
        id = 4
        DataRepository.create_nieuwe_meting_beweging(
            waarde, eenheid, timestamp, id)
        print(waarde)
        socketio.emit("B2F_supply", int(waarde))

    def loop1():

        val1 = hx_1.get_grams()

        hx_1.power_down()
        # time.sleep(.001)
        # hx_1.power_up()

        time.sleep(0.001)
        timestamp = datetime.now()
        waarde = val1
        if waarde < 0:
            waarde = 0
        eenheid = "ml"
        id = 5
        DataRepository.create_nieuwe_meting_beweging(
            waarde, eenheid, timestamp, id)
        print(waarde)
        socketio.emit("B2F_waterbowl", int(waarde))

    def loop2():

        val2 = hx_2.get_grams()

        hx_2.power_down()
        time.sleep(.001)
        hx_2.power_up()

        time.sleep(0.001)
        timestamp = datetime.now()
        val2 = val2
        waarde = val2
        waardeforsite = int(val2)+20
        print(waardeforsite)
        eenheid = "gram"
        id = 6
        DataRepository.create_nieuwe_meting_beweging(
            waarde, eenheid, timestamp, id)
        print(waarde)
        socketio.emit("B2F_bowl", int(waardeforsite))

    def watersupply():
        hx_1 = HX711(6, 13)
        hx_1.set_offset(8728557.0625)
        hx_1.set_scale(392.126)
        val1 = hx_1.get_grams()
        print(val1)
        hx_1.power_down()
        if val1 < 0:
            val1 = 0
        if 0 <= val1 <= 50:
            print("Te weinig water")
            GPIO.output(18, GPIO.LOW)
            time.sleep(60)
            GPIO.output(18, GPIO.HIGH)
        elif val1 > 10:
            GPIO.output(18, GPIO.HIGH)

    setup()
    loop()
    setup1()
    loop1()
    setup2()
    loop2()

    # watersupply()
# second_processdata = threading.Thread(target=read_test)
# second_processdata.start()


@ socketio.on("F2B_weight")
def read_weight(data):
    print("test succes")
    print(data)
    hx_2 = HX711(19, 26)
    hx_2.set_offset(8377960.0625)
    hx_2.set_scale(405.833)
    valbegin = hx_2.get_grams()
    asked_weight = float(data["value"])
    push_weight = valbegin+asked_weight
    while True:
        hx_2 = HX711(19, 26)
        hx_2.set_offset(8377960.0625)
        hx_2.set_scale(405.833)
        val1 = hx_2.get_grams()
        print(val1)
        hx_2.power_down()

        # if val1 < 0:
        #     val1 = 0

        if val1 <= push_weight:
            print(val1)
            # val1 = hx_2.get_grams()
            servo1.ChangeDutyCycle(2+(74/18))
            time.sleep(0.5)
            servo1.ChangeDutyCycle(0)
            servo1.ChangeDutyCycle(2+(70/18))
            time.sleep(0.5)
            servo1.ChangeDutyCycle(0)

        elif val1 >= push_weight:
            print(val1)
            # val1 = hx_2.get_grams()
            servo1.ChangeDutyCycle(2+(70/18))
            time.sleep(0.5)
            servo1.ChangeDutyCycle(0)
            break


@ socketio.on("F2B_chart")
def read_weight(data):
    print(data)
    array = DataRepository.read_data_chart()

    arrayHoev = []
    arrayDag = []

    for diction in array:
        arrayHoev.append(diction["hoeveel"])
        arrayDag.append(diction["dag"])

    arraytotaal = [arrayHoev, arrayDag]

    print(arrayHoev)
    socketio.emit("B2F_arrayhoev", arrayHoev)
    socketio.emit("B2F_arraydagen", arrayDag)
    print(arrayDag)


# while True:
#     hx_2 = HX711(19, 26)
#     hx_2.set_offset(8375759.375)
#     hx_2.set_scale(405.293)
#     val1 = hx_2.get_grams()
#     print(val1)
#     hx_2.power_down()
#     if val1 < 0:
#         val1 = 0
#     if 0 <= val1 <= 40:
#         print(val1)
#         # val1 = hx_2.get_grams()
#         servo1.ChangeDutyCycle(2+(77/18))
#         time.sleep(0.5)
#         servo1.ChangeDutyCycle(0)
#         servo1.ChangeDutyCycle(2+(70/18))
#         time.sleep(0.5)
#         servo1.ChangeDutyCycle(0)

#     elif val1 >= 40:
#         print(val1)
#         # val1 = hx_2.get_grams()
#         servo1.ChangeDutyCycle(2+(70/18))
#         time.sleep(0.5)
#         servo1.ChangeDutyCycle(0)


@ socketio.on("B2F_Datasturen")
def read_waarde():
    objectje = DataRepository.read_waarde_beweging()
    data = objectje['waarde']
    socketio.emit("B2F_data_ontvangen", data)
    print("test123")
# SOCKET IO


# @ socketio.on("B2F_datachart")
# def read_datawaarde():
#     array = DataRepository.read_data_chart()

#     arrayHoev = []
#     arrayDag = []

#     for diction in array:
#         arrayHoev.append(diction["hoeveel"])
#         arrayDag.append(diction["dag"])
#     arraytotaal = [arrayHoev, arrayDag]
#     socketio.emit("B2F_volledige_data_sturen", arraytotaal)


@ socketio.on("B2F_VolledigeDataSturen")
def read_volledige_waarde():
    objectje = DataRepository.read_beweging()
    socketio.emit("B2F_volledige_data_sturen",)


@ socketio.on("F2B_test")
def read_test(data):
    # array = DataRepository.read_data_chart()

    # arrayHoev = []
    # arrayDag = []

    # for diction in array:
    #     arrayHoev.append(diction["hoeveel"])
    #     arrayDag.append(diction["dag"])
    # arraytotaal = [arrayHoev, arrayDag]
    # socketio.emit("B2F_volledige_data_sturen", arraytotaal)

    print(data["value"])
    timestamp = datetime.now()
    eenheid = "bool"
    if GPIO.input(PIN_WATER) == 1:
        print("Water detected! " + (time.strftime("%H:%M:%S")))
        waarde = 1
        id = 3
        value = "enough"
        DataRepository.create_nieuwe_meting_waterniveau(
            waarde, eenheid, timestamp, id)
        socketio.emit("B2F_waterniveau", value)

    elif GPIO.input(PIN_WATER) == 0:
        print("No water detected")
        waarde = 0
        id = 3
        value = "not enough"
        DataRepository.create_nieuwe_meting_waterniveau(
            waarde, eenheid, timestamp, id)
        socketio.emit("B2F_waterniveau", value)

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
        print(temp_c)
        timestamp = datetime.now()
        waarde = int(temp_c)
        eenheid = "graden Celsius"
        id = 2
        DataRepository.create_nieuwe_meting_beweging(
            waarde, eenheid, timestamp, id)
        socketio.emit("B2F_temperature", waarde)
    read_temp()

    hx_trans = HX711(17, 27)
    hx_1 = HX711(6, 13)
    hx_2 = HX711(19, 26)

    def cleanAndExit():
        GPIO.cleanup()

    def setup():
        hx_trans.set_offset(8775534.8125)
        hx_trans.set_scale(431.801)

    def setup1():
        hx_1.set_offset(8728557.0625)
        hx_1.set_scale(392.126)

    def setup2():
        hx_2.set_offset(8385225.125)
        hx_2.set_scale(399.5585)

    def loop():
        val = hx_trans.get_grams()

        hx_trans.power_down()
        # time.sleep(.001)
        # hx_trans.power_up()

        time.sleep(0.001)
        timestamp = datetime.now()
        waarde = val
        eenheid = "gram"
        id = 4
        DataRepository.create_nieuwe_meting_beweging(
            waarde, eenheid, timestamp, id)
        print(waarde)
        socketio.emit("B2F_supply", int(waarde))

    def loop1():

        val1 = hx_1.get_grams()

        hx_1.power_down()
        # time.sleep(.001)
        # hx_1.power_up()

        time.sleep(0.001)
        timestamp = datetime.now()
        waarde = val1
        if waarde < 0:
            waarde = 0
        eenheid = "ml"
        id = 5
        DataRepository.create_nieuwe_meting_beweging(
            waarde, eenheid, timestamp, id)
        print(waarde)
        socketio.emit("B2F_waterbowl", int(waarde))

    def loop2():

        val2 = hx_2.get_grams()

        hx_2.power_down()
        # time.sleep(.001)
        # hx_2.power_up()

        time.sleep(0.001)
        timestamp = datetime.now()
        waarde = val2
        eenheid = "gram"
        id = 6
        DataRepository.create_nieuwe_meting_beweging(
            waarde, eenheid, timestamp, id)
        print(waarde)
        socketio.emit("B2F_bowl", int(waarde))

    setup()
    loop()
    setup1()
    loop1()
    setup2()
    loop2()


try:
    if __name__ == '__main__':
        socketio.run(app, debug=False, host='0.0.0.0')
finally:
    # LCD.lcd_byte(0x01, False)  # 000001 Clear display
    GPIO.cleanup()
