#!/bin/bash
#
#this is necessary to use current display 
set -x
xhost local:root
export DISPLAY=":0.0"
export XAUTHORITY=/root/.Xauthority
#
#ref:https://ubuntuforums.org/showthread.php?t=1648939
#to do get specific details using ne line of code for vendor etc
#
#test to get specific product details and output to file udevadm_info
/sbin/udevadm info -a -p $(udevadm info -q path -n /dev/sdb1) | grep 'idVendor\|idProduct' | head -2 > ~/Desktop/udevadm_info
# result:  ATTRS{idProduct}=="800e"
#
#
# this gives a notification that device is inserted
su root -c 'zenity --notification --text="Device Inserted!"'
#
#open a terminal as root and display a menu script
su root -c 'gnome-terminal -e "bash -c ./usr/local/bin/dialog-menu.sh;bash" &' 

