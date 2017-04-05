#!/bin/bash
#
# USB Driveby Defender
#
#
#---------------------

#set the log path variable
LOG_PATH="/var/log/driveby_defender/"
echo "Capture Remove Device Success!" >> ${LOG_PATH}flash_details.log
while [ -f ${LOG_PATH}flash_details.log ]; do
    #time its always good to wait
    sleep 1
    #
    echo "Deleting! ${LOG_PATH}flash_details.log in script $0" >> ${LOG_PATH}flash_details_deleted.log
    /bin/rm ${LOG_PATH}flash_details.log
done
echo "Done Here! $0" >> ${LOG_PATH}new_flash_details.log 
exit 0
