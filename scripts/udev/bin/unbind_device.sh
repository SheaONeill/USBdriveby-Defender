#!/bin/bash
#
# USB Driveby Defender
#
#unbind keyboard
#---------------------

##get value from check_interface_class.sh
source /usr/local/bin/check_interface_class.sh 
#get this value from check_interface_class.sh
#echo -n "${DEVICE_DRIVER}" > /sys/bus/usb/drivers/usbhid/unbind
            echo "Device detected: $(basename ${dev})"
            echo "Device driver: ${DEVICE_DRIVER}"
            echo "Device path: ${DEVICE_PATH}"
echo -n "${DEVICE_DRIVER}" > ${DEVICE_PATH}unbind
