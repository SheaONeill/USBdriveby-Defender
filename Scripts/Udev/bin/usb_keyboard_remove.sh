#!/bin/bash
echo "Capture Remove Keyboard Device Success!"> ~/Desktop/usb_keyboard_device_removed
#
#export display
export DISPLAY=":0"
export XAUTHORITY=/root/.Xauthority
#
#open a terminal and run usb_keyboard_post_remove.sh script
su root -c 'gnome-terminal -e "bash -c ./usr/local/bin/usb_keyboard_post_remove.sh;bash" &'

