#!/bin/bash
#
# USB Driveby Defender
#
# USB Device Removed
# This script is called when a device is removed
#---------------------
#set log path
LOG_PATH="/var/log/driveby_defender/"
usb_device_removed () {

    if [ -f ${LOG_PATH}keyboard_flag ]; then        
        #script imports
        source /usr/local/bin/export_paths.sh "63-usb-kbd.rules" "keyboard_details.log" "/sys/bus/usb/drivers/usbhid/" "keyboard_flag"
        source /usr/local/bin/log_details.sh $BASH_SOURCE "USB_Keyboard_Device_Removed"     
        #unset flag        
        echo 0 > ${LOG_PATH}${FLAG}
        #get value from keyboard_flag
        echo "Setting ${FLAG} to $(<${LOG_PATH}${FLAG})" >> ${LOG_PATH}${PATH_LOG_NAME}
    fi        
    if [ -f ${LOG_PATH}flash_flag ]; then        
        #script imports
        source /usr/local/bin/export_paths.sh "81-usb-flash.rules" "flash_details.log" "/sys/bus/usb/drivers/usb-storage/" "flash_flag"
        source /usr/local/bin/log_details.sh $BASH_SOURCE "USB_Flash_Device_Removed" 
        #unset flag
        echo 0 > ${LOG_PATH}${FLAG}
        #get value from flash_flag
        echo "Setting ${FLAG} to $(<${LOG_PATH}${FLAG})" >> ${LOG_PATH}${PATH_LOG_NAME}
    fi
    
}

#call usb_device_removed function
usb_device_removed

