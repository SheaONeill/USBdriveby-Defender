#!/bin/bash
#
# USB Driveby Defender
#
# Set Rules for Remove
# This script inserts the model name
# into the rules for the specific device
# note this was necessary otherwise
# the rule wouldn't trigger
#---------------------

#check the path variables
set_remove_rules () {
    
    #cut the product and store in ID_MODEL variable
    ID_MODEL=$(cut -d':' -f 3-4 ${LOG_PATH}${DEVICE_LOG_NAME} | tail -n 1 | xargs)
    idVendor=$(grep -w 'idVendor' ${LOG_PATH}${DEVICE_LOG_NAME} | cut -d'=' -f2 | cut -c1-4 )
    idProduct=$(grep -w 'idProduct' ${LOG_PATH}${DEVICE_LOG_NAME} | cut -d'=' -f2 | cut -c1-4 )
   #store the values in files    
    echo $ID_MODEL>${LOG_PATH}ID_MODEL
    echo $idVendor>${LOG_PATH}idVendor
    echo $idProduct>${LOG_PATH}idProduct
    #get model number and send it to remove in rules  file
    sed -i '/ACTION=="remove"/ c\ACTION=="remove", ENV{ID_MODEL}=="'"${ID_MODEL}"'", RUN+="/usr/local/bin/usb_device_removed.sh" ' ${RULES_PATH}${DEVICE_RULES_PATH}
    #reload rules so change will take affect
    udevadm control --reload
    #udevadm monitor --property #this will follow devices use this for demo
    
    exit 0
}

#call set_remove_rules function
set_remove_rules 
