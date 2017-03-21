#!/bin/bash
#
#add new heading for attributes and append to test text file
echo Inserted USB Devices Attributes: >>/Desktop/did-my_script-work.txt
#
#get attributes for sdb2 and append to test text file
/sbin/udevadm info -a -n /dev/sdb1 >> /Desktop/did-my_script-work.txt
#
#https://ubuntuforums.org/showthread.php?t=1648939
#to do get specific details using ne line of code for vendor etc
#
#add new heading for product specific details
echo Product Specs: >>/Desktop/did-my_script-work.txt
#test to get specific product details and append to test text file
/sbin/udevadm info -a -p $(udevadm info -q path -n /dev/sdb1) | grep idProduct | head -1 >> /Desktop/did-my_script-work.txt
# result:  ATTRS{idProduct}=="800e"

