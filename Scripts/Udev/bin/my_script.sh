#!/bin/bash
#sleep for a second to give the kernel a chance to suss out the usb
sleep 1
#
#get idVendor details and output to file dmesg_result
/bin/dmesg | grep idVendor | tail -n1 > /root/Desktop/dmesg_result
#
#call my_script2.sh
/usr/local/bin/my_script2.sh & 


