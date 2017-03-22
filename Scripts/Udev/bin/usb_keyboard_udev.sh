#!/bin/bash
#sleep for a second to give the kernel a chance to suss out the usb
sleep 1
#
#get idVendor details and output to file dmesg_result
/bin/dmesg | grep idVendor | tail -n1 > /root/Desktop/dmesg_result
#
#
#test to get specific product details and output to file udevadm_info
/sbin/udevadm info -a -p $(udevadm info -q path -n /sys/bus/usb/drivers/usbhid) | grep 'idVendor\|idProduct' | head -2 | cut -d"\"" -f2 > ~/Desktop/udevadm_info
# 
#check if usbhid exists
usb_keyboard=/sys/bus/usb/drivers/usbhid
if [ ! -d $usb_keyboard ]; then
echo "Not a USB HID device" > /root/Desktop/usb_keyboard_result
else
#to do check database
#unbind keyboard
su root -c 'echo -n /sys/bus/usb/drivers/usbhid/3-3:1.0 > unbind'
#test
echo "USB HID Device inserted!" > /root/Desktop/usb_keyboard_result
echo -e "\nDirectory listing"  >> /root/Desktop/usb_keyboard_result
ls -la /sys/bus/usb/drivers/usbhid >> /root/Desktop/usb_keyboard_result
udevadm info -a -p /sys/bus/usb/drivers/usbhid  >> /root/Desktop/usb_keyboard_result
fi
#
#call my_script2.sh
#/usr/local/bin/my_script2.sh & 
#


