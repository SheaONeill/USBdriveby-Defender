#!/bin/bash -x
#
# USB Driveby Defender
#
# Export paths
# This script logs all details for debugging
# 
#---------------------------------------------------------------------

log_details () {
    
    echo -e "\n===============================" >> ${LOG_PATH}${PATH_LOG_NAME}
    echo -e "Script Name: $1">> ${LOG_PATH}${PATH_LOG_NAME}
    echo -e "Timestamp: $(date +%F:%T:%N)">> ${LOG_PATH}${PATH_LOG_NAME}
    echo -e "Log Path Set: ${LOG_PATH}" >> ${LOG_PATH}${PATH_LOG_NAME}
    echo -e "Rules Path Set: ${RULES_PATH}" >> ${LOG_PATH}${PATH_LOG_NAME}
    echo -e "Device Rules Path Set: ${DEVICE_RULES_PATH}" >> ${LOG_PATH}${PATH_LOG_NAME}
    echo -e "Device Log Name: ${DEVICE_LOG_NAME}" >> ${LOG_PATH}${PATH_LOG_NAME}
    echo -e "Device Driver Log Name: ${DEVICE_DRIVER_LOG_NAME}" >> ${LOG_PATH}${PATH_LOG_NAME}
    echo -e "Path Log Name: ${PATH_LOG_NAME}" >> ${LOG_PATH}${PATH_LOG_NAME}
    echo -e "===============================\n" >> ${LOG_PATH}${PATH_LOG_NAME}

}

#call log_details function
log_details $1
