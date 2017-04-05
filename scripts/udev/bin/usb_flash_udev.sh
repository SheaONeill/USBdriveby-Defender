#!/bin/bash
#
# USB Driveby Defender
#
#
#---------------------

#set the log path variable
LOG_PATH="/var/log/driveby_defender/"
while [ ! -f ${LOG_PATH}flash_details.log ]; do
    #time for the kernel: load usb drivers
    sleep 1
    #
    #get idVendor details and output to log
    /bin/dmesg | grep idVendor | tail -n1 >> ${LOG_PATH}flash_details.log
    #
    #set flag
    echo 1 > ${LOG_PATH}flash_flag
done
echo "Done Here! $0" >> ${LOG_PATH}flash_details.log
    #
    #call usb_flash.sh
    /usr/local/bin/usb_flash.sh & 
