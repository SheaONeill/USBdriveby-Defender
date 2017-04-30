#!/bin/bash
#
# USB Driveby Defender
#
# Unbind Device Driver
# This script disables the driver
# for the specific device
# this should be called if its non-human
#---------------------

#check the path variables
echo -e "\nLOG_PATH SET ${LOG_PATH} \nIN $0 " >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "\nDEVICE_RULES_PATH SET ${DEVICE_RULES_PATH} \nIN $0 " >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "\nDEVICE_LOG_NAME ${DEVICE_LOG_NAME} \nIN $0 " >> ${LOG_PATH}${PATH_LOG_NAME}
#added this as DEVICE_LOG_NAME not been exported to check interface
#TODO fix this

echo -e "\nPATH_LOG_NAME ${PATH_LOG_NAME} \nIN $0 " >> ${LOG_PATH}${PATH_LOG_NAME}

#not working at the min need to call function here from interface class
echo "Unbind Device driver: ${DEVICE_DRIVER}"
echo "Unbind Device path: ${DEVICE_PATH}"
echo "Unbind Device log name: ${DEVICE_LOG_NAME}"
echo "Unbind About to unbind cd to ${DEVICE_PATH}"
cd ${DEVICE_PATH}
pwd
##################################
#get this 
#echo -n 3-3:1.0 > unbind
##################################
#echo -n "${DEVICE_DRIVER}" > unbind
