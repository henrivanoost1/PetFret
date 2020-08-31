"""
HX711 Load cell amplifier Python Library
Original source: https://gist.github.com/underdoeg/98a38b54f889fce2b237
Documentation source: https://github.com/aguegu/ardulibs/tree/master/hx711
Adapted by 2017 Jiri Dohnalek

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.


##################
PYTHON 3 EXAMPLE

This version of example is python 3 compatible
and outputs weight in grams.

Make sure you enter the correct values for offset and scale!
Also, don't forget to set the correct gain, default is 128.
"""

import RPi.GPIO as GPIO
import time
import sys
from hx711 import HX711

# Force Python 3 ###########################################################

if sys.version_info[0] != 3:
    raise Exception("Python 3 is required.")

############################################################################


hx_trans = HX711(17, 27)
hx_1 = HX711(6, 13)
hx_2 = HX711(19, 26)


def cleanAndExit():
    print("Cleaning...")
    GPIO.cleanup()
    print("Bye!")
    sys.exit()


def setup():
    hx_trans.set_offset(8393997.1875)
    hx_trans.set_scale(459.8525)
    # hx_1.set_offset(8601824.6875)
    # hx_1.set_scale(392.633)
    # hx_2.set_offset(8247708.9375)
    # hx_2.set_scale(405.9645)
    # 393.4485


def setup1():
    # hx_trans.set_offset(8393997.1875)
    # hx_trans.set_scale(459.8525)
    hx_1.set_offset(8601824.6875)
    hx_1.set_scale(392.633)
    # hx_2.set_offset(8247708.9375)
    # hx_2.set_scale(405.9645)
    # 393.4485


def setup2():
    # hx_trans.set_offset(8393997.1875)
    # hx_trans.set_scale(459.8525)
    # hx_1.set_offset(8601824.6875)
    # hx_1.set_scale(392.633)
    hx_2.set_offset(8377960.0625)
    hx_2.set_scale(405.833)
    # 393.4485


def loop():
    try:
        val = hx_trans.get_grams()
        print(val)

        hx_trans.power_down()
        time.sleep(.001)
        hx_trans.power_up()

        time.sleep(2)

    except (KeyboardInterrupt, SystemExit):
        cleanAndExit()


def loop1():
    try:

        val1 = hx_1.get_grams()
        print(val1)

        hx_1.power_down()
        time.sleep(.001)
        hx_1.power_up()

        time.sleep(2)
    except (KeyboardInterrupt, SystemExit):
        cleanAndExit()


def loop2():
    try:

        val2 = hx_2.get_grams()
        print(val2)

        hx_2.power_down()
        time.sleep(.001)
        hx_2.power_up()

        time.sleep(2)
    except (KeyboardInterrupt, SystemExit):
        cleanAndExit()

##################################


if __name__ == "__main__":
    setup()
    loop()
    setup1()
    loop1()
    setup2()
    loop2()
