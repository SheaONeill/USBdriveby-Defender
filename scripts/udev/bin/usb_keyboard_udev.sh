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
echo "LOG_PATH SET IN KEYBOARD UDEV: ${LOG_PATH}" >> ${LOG_PATH}${PATH_LOG_NAME}

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


