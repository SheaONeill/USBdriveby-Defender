#!/bin/bash
#sleep for a minute to give the kernel a chance to suss out the usb
sleep 1
#
#get dmesg details and  output to a test text file
echo DMESG RESULTS: >/Desktop/did-my_script-work.txt
#
#get idVendor details and append to test text file
/bin/dmesg | grep idVendor >>/Desktop/did-my_script-work.txt
#
#call script2
/usr/local/bin/my_script2.sh 
