#!/bin/bash
#
# open a terminal (not working more research or ask kevin Farrell)
/usr/bin/gnome-terminal &
#
#add a new heading to test text file
echo Inserted USB Devices Details: >>/Desktop/did-my_script-work.txt
#
#get lsusb details and append to test text file
/usr/bin/lsusb >>/Desktop/did-my_script-work.txt
#
#call script3
/usr/local/bin/my_script3.sh 
