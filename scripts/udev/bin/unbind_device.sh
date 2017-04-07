#!/bin/bash
#
# USB Driveby Defender
#
# Unbind Device Driver
#---------------------

##get value from check_interface_class.sh
source /usr/local/bin/check_interface_class.sh 
echo "Device driver: ${DEVICE_DRIVER}"
echo "Device path: ${DEVICE_PATH}"
echo -n "${DEVICE_DRIVER}" > ${DEVICE_PATH}unbind
