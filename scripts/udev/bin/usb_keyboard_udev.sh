#!/bin/bash -x
#
# USB Driveby Defender
#
#
#---------------------

#set the log path variable
LOG_PATH="/var/log/driveby_defender/"

while [ ! -f ${LOG_PATH}keyboard_details.log ]; do
    #time for the kernel: load usb drivers
    sleep 1
    #
    #get idVendor details and output to file dmesg_result
    /bin/dmesg | grep idVendor | tail -n1 >> ${LOG_PATH}keyboard_details.log
    #
    #set flag
    echo 1 > ${LOG_PATH}keyboard_flag
echo "done"
done
echo "Done Here! $0">> ${LOG_PATH}keyboard_details.log

    #test this will unbind keyboard immediatley
    # /usr/local/bin/unbind_device.sh
exit 0


