#!/bin/bash
#
# USB Driveby Defender
#
#
#---------------------

#set the log path variable
LOG_PATH="/var/log/driveby_defender/"
echo "Capture Remove Device Success!"> ${LOG_PATH}keyboard_details.log
while [ -f "${LOG_PATH}keyboard_details.log" ]; do
    #time its always good to wait
    sleep 1
    #
    /bin/rm ${LOG_PATH}keyboard_details.log
done

