#!/bin/bash
#
# USB Driveby Defender
#
#
#---------------------

#ref: http://serverfault.com/a/126325
for dev in /sys/bus/usb/devices/*-*
do
    if [ -f $dev/bInterfaceClass ]
    then 
        #check for interface class HID (0x03) keyboard protocol (0x01)
        if [[ "$(cat $dev/bInterfaceClass)" == "03" && "$(cat $dev/bInterfaceProtocol)" == "01" ]]
        then
            echo "keyboard detected: ${dev}"
            #strip device name (TODO set as varable of tmpfile)
            #ref: Linux and Unix shell programming David Tansley
            device_driver=$(basename ${dev})
            #echo "keyboard detected: $(basename ${dev})"
            echo "Device driver: ${device_driver}"
        fi
    fi
done
