#!/bin/bash
#
# USB Driveby Defender
#
#
#---------------------

#set the log path variable
LOG_PATH="/var/log/driveby_defender/"
#get specific product details and output to file udevadm_info
/sbin/udevadm info -a -p $(udevadm info -q path -n /dev/sdb1) | grep 'idVendor\|idProduct' | head -2 | cut -d"\"" -f2 >> ${LOG_PATH}flash_details.log
#
# this gives a notification that device is inserted
su root -c 'zenity --notification --text="USB Flash Device Inserted!"'
#
echo "Done Here! $0" >> ${LOG_PATH}flash_details.log
exit 0
 

