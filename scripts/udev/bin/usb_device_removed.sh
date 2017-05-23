#!/bin/bash 
#
#Application:   USB Driveby Defender
#Authors:       Shea O'Neill, Paddy Cronan
#Date:          20/03/17
#Version:       1.0
#Title:         usb_device_removed.sh
#Description:   This script updates flags on device removal
#---------------------------------------------------------------------------------

#set log path
LOG_PATH="/var/log/driveby_defender/"
usb_device_removed () {
 
    if [ -f ${LOG_PATH}.keyboard_flag ]; then        
        #script imports
        source /usr/local/bin/export_paths.sh "63-usb-kbd.rules" "keyboard_details.log" "/sys/bus/usb/drivers/usbhid/" ".keyboard_flag"
        source /usr/local/bin/log_details.sh $BASH_SOURCE "USB_Keyboard_Device_Removed"   
           
        #unset flag        
        echo 0 > ${LOG_PATH}${FLAG}
        #get value from .keyboard_flag
        #reset rules
        sed -i '/ACTION=="remove"/ c\ACTION=="remove", ENV{ID_MODEL}=="'"null"'", RUN+="/usr/local/bin/usb_device_removed.sh" ' ${RULES_PATH}${DEVICE_RULES_PATH}     
    fi        
    if [ -f ${LOG_PATH}.flash_flag ]; then        
        #script imports
        source /usr/local/bin/export_paths.sh "81-usb-flash.rules" "flash_details.log" "/sys/bus/usb/drivers/usb-storage/" ".flash_flag"
        source /usr/local/bin/log_details.sh $BASH_SOURCE "USB_Flash_Device_Removed" 
        #get value from .flash_flag
        #unset flag
        echo 0 > ${LOG_PATH}${FLAG}
        #reset rules
        sed -i '/ACTION=="remove"/ c\ACTION=="remove", ATTRS{idVendor}=="'"null"'", ATTRS{idProduct}=="'"null"'", RUN+="/usr/local/bin/usb_device_removed.sh" ' ${RULES_PATH}${DEVICE_RULES_PATH}
    fi
    
}

#call usb_device_removed function
usb_device_removed

