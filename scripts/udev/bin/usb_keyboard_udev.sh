#!/bin/bash -x
#
# USB Driveby Defender
#
# Keyboard Udev
# This script is run when a USB Keyboard is inserted
# (see 63-usb-kbd.rules)
#---------------------------------------------------------------------

#set the log path variable
export LOG_PATH="/var/log/driveby_defender/"
export DEVICE_RULES_PATH="63-usb-kbd.rules"
export DEVICE_LOG_NAME="keyboard_details.log"
export PATH_LOG_NAME="log_path.log"
#check the path variables
echo -e "\n===============================" >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "Script Name: $0">> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "\nTimestamp: $(date)">> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "\nLog Path Set: ${LOG_PATH}" >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "\nDevice Rules Path Set: ${DEVICE_RULES_PATH}" >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "\nDevice Log Name: ${DEVICE_LOG_NAME}" >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "\nPath Log Name: ${PATH_LOG_NAME}" >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "===============================\n" >> ${LOG_PATH}${PATH_LOG_NAME}

    #time for the kernel: load usb drivers
    sleep 1
    echo -e "\n===============================">> ${LOG_PATH}${DEVICE_LOG_NAME}
    echo -e "Script Name: $0">> ${LOG_PATH}${DEVICE_LOG_NAME}
    echo -e "\nTimestamp: $(date)">> ${LOG_PATH}${DEVICE_LOG_NAME}
    echo -e "\nLOG_PATH: ${LOG_PATH}" >> ${LOG_PATH}${DEVICE_LOG_NAME}
    echo -e "\nCalling:  /usr/local/bin/check_interface_class.sh">> ${LOG_PATH}${DEVICE_LOG_NAME}
    echo -e "===============================\n">> ${LOG_PATH}${DEVICE_LOG_NAME}
    #call check_interface_class.sh
    /usr/local/bin/check_interface_class.sh
    echo -e "\n===============================">> ${LOG_PATH}${DEVICE_LOG_NAME}
    echo -e "Back from:  /usr/local/bin/check_interface_class.sh">> ${LOG_PATH}${DEVICE_LOG_NAME}
    echo -e "\nScript Name: $0">> ${LOG_PATH}${DEVICE_LOG_NAME}
    echo -e "\nTimestamp: $(date)">> ${LOG_PATH}${DEVICE_LOG_NAME}
    echo -e "\nLOG_PATH: ${LOG_PATH}" >> ${LOG_PATH}${DEVICE_LOG_NAME}
    echo -e "\nUSB Keyboard udev Device driver: ${DEVICE_DRIVER}" >> ${LOG_PATH}${DEVICE_LOG_NAME}
    echo -e "\nDone Here! $0" >> ${LOG_PATH}${DEVICE_LOG_NAME}
    echo -e "\nCalling:  /usr/local/bin/set_remove_rules.sh"    >> ${LOG_PATH}${DEVICE_LOG_NAME}
    echo -e "===============================\n">> ${LOG_PATH}${DEVICE_LOG_NAME}
    #call set_remove_rules.sh
    /usr/local/bin/set_remove_rules.sh & 
    
    exit 0


