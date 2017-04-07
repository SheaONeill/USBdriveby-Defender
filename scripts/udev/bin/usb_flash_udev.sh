#!/bin/bash
#
# USB Driveby Defender
#
# Flash Udev 
#---------------------

export LOG_PATH="/var/log/driveby_defender/"
export DEVICE_RULES_PATH="81-usb-flash.rules"
export DEVICE_LOG_NAME="flash_details.log"
export PATH_LOG_NAME="log_path.log"
echo "Log Path set in Flash Udev! $0" >> ${LOG_PATH}${PATH_LOG_NAME}

    #time for the kernel: load usb drivers
    sleep 1
    echo "In $0 IF Statement: ${LOG_PATH}" >> ${LOG_PATH}${DEVICE_LOG_NAME}
    #call check_interface_class.sh
    /usr/local/bin/check_interface_class.sh

echo "Done Here! $0" >> ${LOG_PATH}${DEVICE_LOG_NAME}
    #
    #call set_remove_rules.sh
    /usr/local/bin/set_remove_rules.sh & 
    
    exit 0
