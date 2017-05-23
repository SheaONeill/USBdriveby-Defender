#!/bin/bash 
#
#Application:   USB Driveby Defender
#Authors:       Shea O'Neill, Paddy Cronan
#Date:          20/03/17
#Version:       1.0
#Title:         usb_flash_udev.sh
#Description:  	This script is run when a USB Flash is inserted
#Note:          (see 81-usb-flash.rules)
#---------------------------------------------------------------------------------

#script imports
source /usr/local/bin/export_paths.sh "81-usb-flash.rules" "flash_details.log" "/sys/bus/usb/drivers/usb-storage/" ".flash_flag"
source /usr/local/bin/check_interfaces.sh
source /usr/local/bin/log_details.sh $BASH_SOURCE "Setting_flash_paths"
source /usr/local/bin/set_remove_rules.sh 

usb_flash () {

    #time for the kernel: load drivers
    sleep 1        
        
}

#call usb_flash function
usb_flash


