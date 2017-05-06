#!/bin/bash
#
# USB Driveby Defender
#
# Flash Udev 
# This script is run when a USB Flash is inserted
# (see 81-usb-flash.rules)
#----------------------------------------------------------------------

#script imports
source /usr/local/bin/export_paths.sh
source /usr/local/bin/log_details.sh
source /usr/local/bin/check_interface_class.sh
source /usr/local/bin/set_remove_rules.sh &

usb_flash () {

    #time for the kernel: load usb drivers
    sleep 1
        
    exit 0
    
}

#call export_paths function
export_paths 81-usb-flash.rules flash_details.log
#call log_details function
log_details $0
#call usb_flash function
usb_flash
#call check_interface function
check_interface
#call set_remove_rules function
set_remove_rules

