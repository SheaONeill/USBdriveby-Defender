#!/bin/bash
#shutdown -r now
sleep 2
echo ---------------------------------- > /root/Desktop/testUsbScript.txt
echo -------- my_script.sh ----------- >> /root/Desktop/testUsbScript.txt
#echo $DISPLAY >> /root/Desktop/testUsbScript.txt
#env >> /root/Desktop/testUsbScript.txt

echo Testing my_script >> /root/Desktop/testUsbScript.txt

#export DISPLAY=:0
#export XAUTHORITY=/run/user/0/gdm/Xauthority
#export XAUTHORITY="/root/.Xauthority"
echo calling my_script2 >> /root/Desktop/testUsbScript.txt
/usr/local/bin/my_script2.sh & 
echo ---------------------------------- >> /root/Desktop/testUsbScript.txt
echo

