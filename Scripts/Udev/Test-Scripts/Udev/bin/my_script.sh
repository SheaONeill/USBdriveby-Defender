#!/bin/bash
#sleep for a minute to give the kernel a chance to suss out the usb
sleep 1
#
#get dmesg details and  output to file test_01a.txt
echo DMESG RESULTS: > ~/Desktop/test_01a.txt
#
#get idVendor details and output to file test_01b.txt
/bin/dmesg | grep idVendor > ~/Desktop/test_01b.txt
#
#call my_script2.sh
/usr/local/bin/my_script2.sh & 


