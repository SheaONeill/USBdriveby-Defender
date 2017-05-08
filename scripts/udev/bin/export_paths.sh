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
    export CHARACTER_LOG="character_input.log"
    export DEVICE_RULES_PATH="$1"
    export DEVICE_LOG_NAME="$2"
    export DEVICE_PATH="$3"
    export FLAG="$4"
    export DEVICE_DRIVER_LOG_NAME="device_driver.log"
    export PATH_LOG_NAME="log_path.log"
    export RULES_PATH="/etc/udev/rules.d/"
    export VENDOR_ID="idVendor"
    export PRODUCT_ID="idProduct"
    export MODEL_ID="ID_MODEL"
  
}

#call export_paths function
export_paths $1 $2 $3 $4
