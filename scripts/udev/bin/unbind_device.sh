#!/bin/bash
#
# USB Driveby Defender
#
# Unbind Device Driver
#---------------------

#check the path variables
echo -e "\nLOG_PATH SET ${LOG_PATH} \nIN $0 " >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "\nDEVICE_RULES_PATH SET ${DEVICE_RULES_PATH} \nIN $0 " >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "\nDEVICE_LOG_NAME ${DEVICE_LOG_NAME} \nIN $0 " >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "\nPATH_LOG_NAME ${PATH_LOG_NAME} \nIN $0 " >> ${LOG_PATH}${PATH_LOG_NAME}
##get value from check_interface_class.sh
source /usr/local/bin/check_interface_class.sh 
echo "Device driver: ${DEVICE_DRIVER}"
echo "Device path: ${DEVICE_PATH}"
echo -n "${DEVICE_DRIVER}" > ${DEVICE_PATH}unbind
