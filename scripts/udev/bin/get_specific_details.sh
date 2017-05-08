#!/bin/bash
#
# USB Driveby Defender
#
# Get Specific Details of device
# This script pulls model name,
# vendor and product ids from
# the device log
# store the values in seperate files
#---------------------

get_specific_details () {

    #cut the product and store in ID_MODEL variable
    ID_MODEL=$(cut -d':' -f 3-4 ${LOG_PATH}${DEVICE_LOG_NAME} | tail -n 1 | xargs)
    idVendor=$(grep -w 'idVendor' ${LOG_PATH}${DEVICE_LOG_NAME} | cut -d'=' -f2 | cut -c1-4 )
    idProduct=$(grep -w 'idProduct' ${LOG_PATH}${DEVICE_LOG_NAME} | cut -d'=' -f3 | cut -c1-4 )
    #store the values in seperate files    
    echo $ID_MODEL>${LOG_PATH}${MODEL_ID}
    echo $idVendor>${LOG_PATH}${VENDOR_ID}
    echo $idProduct>${LOG_PATH}${PRODUCT_ID}   
    
}

#call get_specific_details function
get_specific_details
