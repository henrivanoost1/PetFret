# import RPi.GPIO as GPIO
# import time

# servo_pin = 13
# duty_cycle = 7.5     # Should be the centre for a SG90

# # Configure the Pi to use pin names (i.e. BCM) and allocate I/O
# GPIO.setmode(GPIO.BCM)
# GPIO.setup(servo_pin, GPIO.OUT)

# # Create PWM channel on the servo pin with a frequency of 50Hz
# pwm_servo = GPIO.PWM(servo_pin, 50)
# pwm_servo.start(duty_cycle)

# try:
#     while True:
#         duty_cycle = float(input("Enter Duty Cycle (Left = 5 to Right = 10):"))
#         pwm_servo.ChangeDutyCycle(duty_cycle)

# except KeyboardInterrupt:
#     print("CTRL-C: Terminating program.")
# finally:
#     print("Cleaning up GPIO...")
#     GPIO.cleanup()

import RPi.GPIO as GPIO
import time
import schedule
from datetime import datetime
GPIO.cleanup

# Set GPIO numbering mode
GPIO.setmode(GPIO.BCM)

# Set pin 11 as an output, and define as servo1 as PWM pin
GPIO.setup(5, GPIO.OUT)
servo1 = GPIO.PWM(5, 50)  # pin 11 for servo1, pulse 50Hz

# Start PWM running, with value of 0 (pulse off)
servo1.start(0)


def job():
    print("test")

# Loop to allow user to set servo angle. Try/finally allows exit
# with execution of servo.stop and GPIO cleanup :)


schedule.every(10).seconds.do(job)
try:
    while True:
        # print(str(datetime.strptime))
        # time.sleep(2)
        schedule.run_pending()
        time.sleep(1)
        # Ask user for angle and turn servo to it
        # def action():
        #     servo1.ChangeDutyCycle(2+(82/18))
        #     time.sleep(0.5)
        #     servo1.ChangeDutyCycle(0)
        # s = sched.scheduler(time.localtime, time.sleep)
        # # Schedule when you want the action to occur
        # s.enterabs(time.strptime('Fri Aug 28 13:21:00 2020'), 0, action)
        # # Block until the action has been run
        # s.run()

finally:
    # Clean things up at the end
    servo1.stop()
    GPIO.cleanup()
    print("Goodbye!")

# 82 open
# 75 sluiten82
