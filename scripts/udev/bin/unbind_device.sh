#!/bin/bash
#
# USB Driveby Defender
#
#unbind keyboard
#---------------------

#echo -n "3-3:1.0" > /sys/bus/usb/drivers/usbhid/unbind
#get this value from check_interface_class.sh
echo -n "${device_driver}" > /sys/bus/usb/drivers/usbhid/unbind
