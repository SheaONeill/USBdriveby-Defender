#!/bin/bash
#
# USB Driveby Defender
#
# Unbind Device Driver
# This script disables the driver
# for the specific device
# this should be called if threat is detected
#---------------------

unbind_device () {
    #check the path variables
    source /usr/local/bin/log_details.sh $BASH_SOURCE "USB_Device_Unbound"   
    #get value from logfile
    export DEVICE_DRIVER=$(<${LOG_PATH}${DEVICE_DRIVER_LOG_NAME})
    #change to device dir
    cd ${DEVICE_PATH}
    #unbind device
    echo -n "${DEVICE_DRIVER}" > unbind
}

#call unbin_device function
unbind_device
