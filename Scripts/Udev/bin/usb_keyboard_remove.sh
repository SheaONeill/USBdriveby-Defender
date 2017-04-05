#!/bin/bash
#
# USB Driveby Defender
#
#
#---------------------

#set the log path variable
LOG_PATH="/var/log/driveby_defender/"
echo "Capture Remove Device Success!" >> ${LOG_PATH}keyboard_details.log
while [ -f ${LOG_PATH}keyboard_details.log ]; do
    #time its always good to wait
    sleep 1
    #
    echo "Deleting! ${LOG_PATH}keyboard_details.log in script $0" >> ${LOG_PATH}keyboard_details_deleted.log
    /bin/rm ${LOG_PATH}keyboard_details.log
done
echo "Done Here! $0" >> ${LOG_PATH}new_keyboard_details.log
exit 0
