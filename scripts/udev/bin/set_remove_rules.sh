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
                  
    if [ -f ${LOG_PATH}.keyboard_flag ] || [ -f ${LOG_PATH}.flash_flag ] ; then
        #check to see if keyboard_flag is set
        if  [[ $(head -1 ${LOG_PATH}.keyboard_flag) == 1 ]] ;then
            #get model number and send it to remove in rules  file
            sed -i '/ACTION=="remove"/ c\ACTION=="remove", ENV{ID_MODEL}=="'"${ID_MODEL}"'", RUN+="/usr/local/bin/usb_device_removed.sh" ' ${RULES_PATH}${DEVICE_RULES_PATH}                        
        elif  [[ $(head -1 ${LOG_PATH}.flash_flag) == 1 ]] ;then
            #get vendor and product id and send it to remove in rules  file
            sed -i '/ACTION=="remove"/ c\ACTION=="remove", ATTRS{idVendor}=="'"${idVendor}"'", ATTRS{idProduct}=="'"${idProduct}"'", RUN+="/usr/local/bin/usb_device_removed.sh" ' ${RULES_PATH}${DEVICE_RULES_PATH}
        fi
        
    fi
    #reload rules so change will take affect
     udevadm control --reload-rules && udevadm trigger  
}

#call set_remove_rules function
set_remove_rules 
