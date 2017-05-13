#!/bin/bash
#
# USB Driveby Defender
#
# Flash Udev 
# This script is run when a USB Flash is inserted
# (see 81-usb-flash.rules)
#----------------------------------------------------------------------

#script imports
source /usr/local/bin/export_paths.sh "81-usb-flash.rules" "flash_details.log" "/sys/bus/usb/drivers/usb-storage/" ".flash_flag"
source /usr/local/bin/check_interface_class.sh
source /usr/local/bin/log_details.sh $BASH_SOURCE "Setting_flash_paths"
source /usr/local/bin/set_remove_rules.sh 

usb_flash () {

    #time for the kernel: load usb drivers
    sleep 1        
        
}

#call usb_flash function
usb_flash


