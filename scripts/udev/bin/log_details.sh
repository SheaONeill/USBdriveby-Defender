#!/bin/bash 
#
#Application:   USB Driveby Defender
#Authors:       Shea O'Neill, Paddy Cronan
#Date:          20/03/17
#Version:       1.0
#Title:         log_details.sh
#Description:  	This script logs everything for testing
#------------------------------------------------------------------------

log_details () {
    
    echo -e "\n===============================" >> ${LOG_PATH}${PATH_LOG_NAME}
    echo -e "Script Name: $1">> ${LOG_PATH}${PATH_LOG_NAME}
    echo -e "Timestamp: $(date +%F:%T:%N)">> ${LOG_PATH}${PATH_LOG_NAME}
    echo -e "Log Path Set: ${LOG_PATH}" >> ${LOG_PATH}${PATH_LOG_NAME}
    echo -e "Path Log Name: ${PATH_LOG_NAME}" >> ${LOG_PATH}${PATH_LOG_NAME}
    echo -e "Rules Path Set: ${RULES_PATH}" >> ${LOG_PATH}${PATH_LOG_NAME}
    echo -e "Device Rules Path Set: ${DEVICE_RULES_PATH}" >> ${LOG_PATH}${PATH_LOG_NAME}
    echo -e "Device Log Name: ${DEVICE_LOG_NAME}" >> ${LOG_PATH}${PATH_LOG_NAME}
    echo -e "Device Path: ${DEVICE_PATH}" >> ${LOG_PATH}${PATH_LOG_NAME}
    echo -e "Device Driver Log Name: ${DEVICE_DRIVER_LOG_NAME}" >> ${LOG_PATH}${PATH_LOG_NAME}
    echo -e "Device Log Name: ${DEVICE_LOG_NAME}" >> ${LOG_PATH}${PATH_LOG_NAME}
    echo -e "Device Flag Name: ${FLAG}" >> ${LOG_PATH}${PATH_LOG_NAME}
    echo -e "Vendor ID: $(<${LOG_PATH}${VENDOR_ID})" >> ${LOG_PATH}${PATH_LOG_NAME}    
    echo -e "Product ID: $(<${LOG_PATH}${PRODUCT_ID})" >> ${LOG_PATH}${PATH_LOG_NAME}
    echo -e "Model ID: $(<${LOG_PATH}${MODEL_ID})" >> ${LOG_PATH}${PATH_LOG_NAME}
    echo -e "Comment: $2" >> ${LOG_PATH}${PATH_LOG_NAME}
    echo -e "===============================\n" >> ${LOG_PATH}${PATH_LOG_NAME}

}

#call log_details function
log_details $1 $2
