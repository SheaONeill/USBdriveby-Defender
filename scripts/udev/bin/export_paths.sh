#!/bin/bash 
#
# USB Driveby Defender
#
# Export paths
# This script exports all the log file paths 
# 
#---------------------------------------------------------------------

export_paths () {

    #set the log path variable
    export LOG_PATH="/var/log/driveby_defender/"
    export DEVICE_RULES_PATH="63-usb-kbd.rules"
    export DEVICE_LOG_NAME="keyboard_details.log"
    export PATH_LOG_NAME="log_path.log"
    export RULES_PATH="/etc/udev/rules.d/"
}

#call export_paths function
export_paths 
