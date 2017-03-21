#!/bin/bash
#export DISPLAY=:0
#export XAUTHORITY=/run/user/0/gdm/Xauthority
echo ---------------------------------- >> /root/Desktop/testUsbScript.txt
echo -------- my_script2.sh ----------- >> /root/Desktop/testUsbScript.txt
echo exporting display $DISPLAY >> /root/Desktop/testUsbScript.txt

#ref: https://ubuntuforums.org/showthread.php?t=1865740
sleep 1
#DISPLAY=":0.0"
set -x
xhost local:root
DISPLAY=":0"
HOME=/root
XAUTHORITY=/run/user/0/gdm/Xauthority
export DISPLAY XAUTHORITY HOME

echo try open terminal >> /root/Desktop/testUsbScript.txt
#/usr/bin/gnome-terminal &
echo Testing my_script2 >> /root/Desktop/testUsbScript.txt
/usr/bin/gnome-terminal -x bash -c "tail -f /var/log/syslog" 
echo calling terminal with parameters >> /root/Desktop/testUsbScript.txt
/usr/bin/gnome-terminal -e 'bash -c "tail -f /var/log/syslog"' & 
echo ---------------------------------- >> /root/Desktop/testUsbScript.txt
echo
env >> /root/Desktop/testUsbScript.txt
