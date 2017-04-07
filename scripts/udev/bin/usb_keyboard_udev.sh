#!/bin/bash -x
#
# USB Driveby Defender
#
# Keyboard Udev
#---------------------

#set the log path variable
export LOG_PATH="/var/log/driveby_defender/"
export DEVICE_RULES_PATH="63-usb-kbd.rules"
export DEVICE_LOG_NAME="keyboard_details.log"
export PATH_LOG_NAME="log_path.log"
#check the path variables
echo -e "\nLog Path Set: ${LOG_PATH} \nIn Keyboard Udev " >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "\nDevice Rules Path Set: ${DEVICE_RULES_PATH} \nIn Keyboard Udev $0 " >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "\nDevice Log Name: ${DEVICE_LOG_NAME} \nIn Keyboard Udev " >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "\nPath Log Name ${PATH_LOG_NAME} \nIn Keyboard Udev " >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "\n--------------------------------------------------------------------\n"

    #time for the kernel: load usb drivers
    sleep 1
    echo "IN IF STATEMENT: ${LOG_PATH}" >> ${LOG_PATH}${DEVICE_LOG_NAME}
    #call check_interface_class.sh
    /usr/local/bin/check_interface_class.sh

echo "Done Here! $0" >> ${LOG_PATH}${DEVICE_LOG_NAME}

    #test this will unbind keyboard immediatley
    # /usr/local/bin/unbind_device.sh
#
    #call set_remove_rules.sh
    /usr/local/bin/set_remove_rules.sh & 
    
    exit 0


