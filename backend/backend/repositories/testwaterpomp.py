import RPi.GPIO as GPIO       	# Import required Python libraries
import time
GPIO.setwarnings(False)
GPIO.setmode(GPIO.BCM)
GPIO.setup(18, GPIO.OUT)


def onlamp():
    GPIO.output(18, GPIO.HIGH)


def offlamp():
    GPIO.output(18, GPIO.LOW)


offlamp()
time.sleep(10)
onlamp()
