#!/bin/bash
echo "Capture Remove Device Success!"> ~/Desktop/device_removed
#export display
export DISPLAY=":0"
export XAUTHORITY=/root/.Xauthority
#
#open a terminal and run script
su root -c 'gnome-terminal -e "bash -c ./usr/local/bin/usb_flash_post_remove.sh;bash" &'
 
