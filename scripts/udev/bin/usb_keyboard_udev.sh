#!/bin/bash 
#
#Application:   USB Driveby Defender
#Authors:       Shea O'Neill, Paddy Cronan
#Date:          20/03/17
#Version:       1.0
#Title:         usb_keyboard_udev.sh
#Description:   This script is run when a USB Keyboard is inserted
#Note:          (see 63-usb-kbd.rules)
#------------------------------------------------------------------------------------------

usb_keyboard () {

    #time for the kernel: load drivers    
    sleep 1  
            
}

#script imports
    source /usr/local/bin/export_paths.sh "63-usb-kbd.rules" "keyboard_details.log" "/sys/bus/usb/drivers/usbhid/" ".keyboard_flag"
    source /usr/local/bin/check_interfaces.sh
    source /usr/local/bin/log_details.sh $BASH_SOURCE "Setting_keyboard_paths"
    #call usb_keyboard function
    usb_keyboard




