#!/bin/bash 
#
#Application:   USB Driveby Defender
#Authors:       Shea O'Neill, Paddy Cronan
#Date:          20/03/17
#Version:       1.0
#Title:         unbind_device.sh
#Description:   This script disables the device driver
#------------------------------------------------------------------------

unbind_device () {
    #check the path variables
    source /usr/local/bin/log_details.sh $BASH_SOURCE "USB_Device_Unbound"   
    #get value from logfile
    export DEVICE_DRIVER=$(<${LOG_PATH}${DEVICE_DRIVER_LOG_NAME})
    #change to device dir
    cd ${DEVICE_PATH}
    #unbind device
    echo -n "${DEVICE_DRIVER}" > unbind 
    #clear
}

#call unbind_device function
unbind_device
