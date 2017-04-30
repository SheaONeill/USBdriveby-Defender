#!/bin/bash
#
# USB Driveby Defender
#
# Flash Udev 
# This script is run when a USB Flash is inserted
# (see 81-usb-flash.rules)
#----------------------------------------------------------------------

export LOG_PATH="/var/log/driveby_defender/"
export DEVICE_RULES_PATH="81-usb-flash.rules"
export DEVICE_LOG_NAME="flash_details.log"
export PATH_LOG_NAME="log_path.log"
#check the path variables
echo -e "\n===============================" >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "Script Name: $0">> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "Timestamp: $(date +%F:%T:%N)">> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "Log Path Set: ${LOG_PATH}" >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "Device Rules Path Set: ${DEVICE_RULES_PATH}" >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "Device Log Name: ${DEVICE_LOG_NAME}" >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "Device Driver Log Name: ${DEVICE_DRIVER_LOG_NAME}" >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "Path Log Name ${PATH_LOG_NAME}" >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "===============================\n" >> ${LOG_PATH}${PATH_LOG_NAME}

    #time for the kernel: load usb drivers
    sleep 1
    echo -e "\n===============================">> ${LOG_PATH}${DEVICE_LOG_NAME}
    echo -e "Script Name: $0">> ${LOG_PATH}${DEVICE_LOG_NAME}
    echo -e "Timestamp: $(date +%F:%T:%N)">> ${LOG_PATH}${DEVICE_LOG_NAME}
    echo -e "LOG_PATH: ${LOG_PATH}" >> ${LOG_PATH}${DEVICE_LOG_NAME}
    echo -e "Calling:  /usr/local/bin/check_interface_class.sh">> ${LOG_PATH}${DEVICE_LOG_NAME}
    echo -e "===============================\n">> ${LOG_PATH}${DEVICE_LOG_NAME}
    #call check_interface_class.sh
    /usr/local/bin/check_interface_class.sh
    echo -e "\n===============================">> ${LOG_PATH}${DEVICE_LOG_NAME}
    echo -e "Back from:  /usr/local/bin/check_interface_class.sh">> ${LOG_PATH}${DEVICE_LOG_NAME}
    echo -e "Script Name: $0">> ${LOG_PATH}${DEVICE_LOG_NAME}
    echo -e "Timestamp: $(date +%F:%T:%N)">> ${LOG_PATH}${DEVICE_LOG_NAME}
    echo -e "LOG_PATH: ${LOG_PATH}" >> ${LOG_PATH}${DEVICE_LOG_NAME}
    echo -e "Device Driver Log Name: ${DEVICE_DRIVER_LOG_NAME}" >> ${LOG_PATH}${PATH_LOG_NAME}
    echo -e "USB udev Device driver: ?????? ${DEVICE_DRIVER}" >> ${LOG_PATH}${DEVICE_LOG_NAME}
    echo -e "Done Here! $0" >> ${LOG_PATH}${DEVICE_LOG_NAME}
    echo -e "Calling:  /usr/local/bin/set_remove_rules.sh"  >> ${LOG_PATH}${DEVICE_LOG_NAME} 
    echo -e "===============================\n"  >> ${LOG_PATH}${DEVICE_LOG_NAME}
    #call set_remove_rules.sh
    /usr/local/bin/set_remove_rules.sh & 
    
    exit 0
