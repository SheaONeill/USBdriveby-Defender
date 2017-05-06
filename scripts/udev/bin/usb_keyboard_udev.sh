#!/bin/bash -x
#
# USB Driveby Defender
#
# Keyboard Udev
# This script is run when a USB Keyboard is inserted
# (see 63-usb-kbd.rules)
#---------------------------------------------------------------------

#script imports
source /usr/local/bin/export_paths.sh
source /usr/local/bin/log_details.sh
source /usr/local/bin/check_interface_class.sh
source /usr/local/bin/set_remove_rules.sh 

usb_keyboard () {
    #time for the kernel: load usb drivers
    sleep 1  
    
    exit 0
}

#call export_paths function
export_paths 
#call log_details function
log_details $0
#call usb_keyboard function
usb_keyboard
#call check_interface function
check_interface
#call set_remove_rules function
set_remove_rules

