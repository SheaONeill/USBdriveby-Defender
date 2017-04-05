#!/bin/bash
cd /root/Desktop
echo "USB FlashDevice Removed"
#
#display created files

tail -n +1 {dmesg_result,udevadm_info,device_removed}
#get info from udevadm_info
product=$(cat /root/Desktop/udevadm_info | tail -1)
vendor=$(cat /root/Desktop/udevadm_info | head -1)
#
echo "Vendor $vendor Product $product"
#
#this will list last modified files
echo "last 4 modified files:"
ls -Art | tail -n4
#
#this will lock the screen
#uncomment this next line
#dbus-send --type=method_call --dest=org.gnome.ScreenSaver /org/gnome/ScreenSaver org.gnome.ScreenSaver.Lock
echo "removing files"
rm ~/Desktop/{dmesg_result,udevadm_info,device_removed}
