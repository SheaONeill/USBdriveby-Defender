#!/bin/bash
echo "Capture Remove Device Success!"> ~/Desktop/device_removed
#export display
export DISPLAY=":0"
export XAUTHORITY=/root/.Xauthority
#
# this gives a notification that device is removed
su root -c 'zenity --notification --text="Device Removed!'
#
#open a terminal and run script
#ref: http://stackoverflow.com/questions/38135995/how-to-open-a-gnome-terminal-to-execute-a-command-with-gnome-terminal-constantl
su root -c 'gnome-terminal -e "bash -c ./usr/local/bin/post_remove.sh;bash" &'
#
#keep these for reference
#
#/usr/bin/gnome-terminal -x bash -c "tail -f /var/log/syslog" 
#/usr/bin/gnome-terminal -e 'bash -c "tail -f /var/log/syslog"' & 

