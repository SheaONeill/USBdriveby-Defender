#!/bin/bash
#
# USB Driveby Defender
#
# USB Device Removed
# This script is called when a device is removed
#---------------------

#set the log path variable
export LOG_PATH="/var/log/driveby_defender/"
export DEVICE_LOG_NAME="device_removed_details.log"
export PATH_LOG_NAME="log_path.log"
#check the path variables
echo -e "\nLog Path Set: ${LOG_PATH} \nIn  USB Device Removed" >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "\nDevice Rules Path Set: ${DEVICE_RULES_PATH} \nIn  USB Device Removed$0 " >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "\nDevice Log Name: ${DEVICE_LOG_NAME} \nIn  USB Device Removed" >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "\nPath Log Name ${PATH_LOG_NAME} \nIn  USB Device Removed" >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "\n--------------------------------------------------------------------\n"

#
if [ -f ${LOG_PATH}keyboard_flag ]; then
    #time its always good to wait
    sleep 1
    echo "In IF Keybord Statement: ${LOG_PATH}" >> ${LOG_PATH}${DEVICE_LOG_NAME}
    #
    #unset flag
    echo 0 > ${LOG_PATH}keyboard_flag

fi
    
if [ -f ${LOG_PATH}flash_flag ]; then
    #time its always good to wait
    sleep 1
    echo "In IF Flash Statement: ${LOG_PATH}" >> ${LOG_PATH}${DEVICE_LOG_NAME}
    #
    #unset flag
    echo "Setting flash_flag to ZERO: ${LOG_PATH}" >> ${LOG_PATH}${DEVICE_LOG_NAME}
    echo 0 > ${LOG_PATH}flash_flag

fi
echo "Done Here! $0" >> ${LOG_PATH}${DEVICE_LOG_NAME}

exit 0
