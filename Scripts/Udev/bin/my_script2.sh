#!/bin/bash
#
#get lsusb details and output to text file test_02a.txt
/usr/bin/lsusb > ~/Desktop/test_02a.txt
#
#this is necessary to use current display 
set -x
xhost local:root
export DISPLAY=":0.0"
export XAUTHORITY=/root/.Xauthority
#
#
#get attributes for sdb? and output to file test_02b.txt
/sbin/udevadm info -a -n /dev/sdb1 > ~/Desktop/test_02b.txt
#
#
#https://ubuntuforums.org/showthread.php?t=1648939
#to do get specific details using ne line of code for vendor etc
#
#test to get specific product details and output to file test_02c.txt
/sbin/udevadm info -a -p $(udevadm info -q path -n /dev/sdb1) | grep idProduct | head -1 > ~/Desktop/test_02c.txt
# result:  ATTRS{idProduct}=="800e"
#
#
# this gives a notification that device is inserted
su root -c 'zenity --notification --text="Device Inserted!"'
#
#open a terminal and run script
#ref: http://stackoverflow.com/questions/38135995/how-to-open-a-gnome-terminal-to-execute-a-command-with-gnome-terminal-constantl
su root -c 'gnome-terminal -e "bash -c ./usr/local/bin/testScript.sh;bash" &'
#
#open a terminal as root and display syslog details
#this will be replaced by a menu script
su root -c 'gnome-terminal -x bash -c "tail -f /var/log/syslog"' 
#
#by using xterm the device does not automount
#xterm -e 'sh -c "vi $HOME/foo.txt; sh"'
#xterm -e 'sh -c "/usr/local/bin/testScript.sh; sh"' &
