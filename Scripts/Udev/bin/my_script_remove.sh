#!/bin/bash
echo test_03 Remove Device > ~/Desktop/test_03.txt
#echo try to export display >> ~/Desktop/test_03.txt
#set -x
#xhost local:root
export DISPLAY=":0"
export XAUTHORITY=/root/.Xauthority
echo DISPLAY=$DISPLAY >> ~/Desktop/test_03.txt
echo XAUTHORITY=$XAUTHORITY >> ~/Desktop/test_03.txt
#
# this gives a notification that device is inserted
su root -c 'zenity --notification --text="Device Removed!'
#
#open a terminal and run script
#ref: http://stackoverflow.com/questions/38135995/how-to-open-a-gnome-terminal-to-execute-a-command-with-gnome-terminal-constantl
su root -c 'gnome-terminal -e "bash -c ./usr/local/bin/testScript2.sh;bash" &'
#
#keep these for reference
#
#/usr/bin/gnome-terminal -x bash -c "tail -f /var/log/syslog" 
#/usr/bin/gnome-terminal -e 'bash -c "tail -f /var/log/syslog"' & 
#xterm -e 'sh -c "/usr/local/bin/testScript2.sh; sh"'
#su root /usr/bin/gnome-terminal
