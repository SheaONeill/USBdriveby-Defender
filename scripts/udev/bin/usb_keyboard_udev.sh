#!/bin/bash 
#
# USB Driveby Defender
#
# Keyboard Udev
# This script is run when a USB Keyboard is inserted
# (see 63-usb-kbd.rules)
#---------------------------------------------------------------------

#script imports
source /usr/local/bin/export_paths.sh "63-usb-kbd.rules" "keyboard_details.log" "/sys/bus/usb/drivers/usbhid/" ".keyboard_flag"
source /usr/local/bin/check_interface_class.sh
source /usr/local/bin/log_details.sh $BASH_SOURCE "Setting_keyboard_paths"
source /usr/local/bin/set_remove_rules.sh 

usb_keyboard () {

    #time for the kernel: load usb drivers
    sleep 1  
    
    #exit 0
}

#call usb_keyboard function
usb_keyboard

