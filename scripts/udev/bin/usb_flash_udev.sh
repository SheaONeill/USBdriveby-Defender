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
echo -e "\nScript Name: $0">> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "\nTimestamp: $(date)">> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "\nLog Path Set: ${LOG_PATH}" >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "\nDevice Rules Path Set: ${DEVICE_RULES_PATH}" >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "\nDevice Log Name: ${DEVICE_LOG_NAME}" >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "\nPath Log Name ${PATH_LOG_NAME}" >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "===============================\n" >> ${LOG_PATH}${PATH_LOG_NAME}

    #time for the kernel: load usb drivers
    sleep 1
    echo -e "\n===============================">> ${LOG_PATH}${DEVICE_LOG_NAME}
    echo -e "\nScript Name: $0">> ${LOG_PATH}${DEVICE_LOG_NAME}
    echo -e "\nTimestamp: $(date)">> ${LOG_PATH}${DEVICE_LOG_NAME}
    echo -e "\nLOG_PATH: ${LOG_PATH}" >> ${LOG_PATH}${DEVICE_LOG_NAME}
    echo -e "\nCalling:  /usr/local/bin/check_interface_class.sh">> ${LOG_PATH}${DEVICE_LOG_NAME}
    echo -e "===============================\n">> ${LOG_PATH}${DEVICE_LOG_NAME}
    #call check_interface_class.sh
    /usr/local/bin/check_interface_class.sh
    echo -e "\n===============================">> ${LOG_PATH}${DEVICE_LOG_NAME}
    echo -e "\nBack from:  /usr/local/bin/check_interface_class.sh">> ${LOG_PATH}${DEVICE_LOG_NAME}
    echo -e "\nScript Name: $0">> ${LOG_PATH}${DEVICE_LOG_NAME}
    echo -e "\nTimestamp: $(date)">> ${LOG_PATH}${DEVICE_LOG_NAME}
    echo -e "\nLOG_PATH: ${LOG_PATH}" >> ${LOG_PATH}${DEVICE_LOG_NAME}
    echo -e "\nUSB Keyboard udev Device driver: ${DEVICE_DRIVER}" >> ${LOG_PATH}${DEVICE_LOG_NAME}
    echo "Done Here! $0" >> ${LOG_PATH}${DEVICE_LOG_NAME}
    echo -e "\nCalling:  /usr/local/bin/set_remove_rules.sh"  >> ${LOG_PATH}${DEVICE_LOG_NAME} 
    echo -e "===============================\n"  >> ${LOG_PATH}${DEVICE_LOG_NAME}
    #call set_remove_rules.sh
    /usr/local/bin/set_remove_rules.sh & 
    
    exit 0
