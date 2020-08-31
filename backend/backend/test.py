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
# import repositories.LCD


# repositories.LCD.setuplcd()


GPIO.cleanup()
GPIO.setwarnings(False)
GPIO.setmode(GPIO.BCM)
PIN_PIR = 25
PIN_WATER = 12
pin_voedingsbak_eten = [29, 31]

GPIO.setwarnings(False)
GPIO.setup(PIN_WATER, GPIO.IN)
GPIO.setup(PIN_PIR, GPIO.IN)

array = DataRepository.read_data_chart()

arrayHoev = []
arrayDag = []


for diction in array:
    print(diction["hoeveel"])
    arrayHoev.append(diction["hoeveel"])
    arrayDag.append(diction["dag"])

arraytotaal = [arrayHoev, arrayDag]

print(arrayHoev)
print(arrayDag)

# for key in x:
#     print(x[key])
