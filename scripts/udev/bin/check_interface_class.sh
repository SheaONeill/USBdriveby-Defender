#!/bin/bash
#
# USB Driveby Defender
#
# Check Interface
# This script is run to check the description
# of the device insertered and set flag
#---------------------
#check the path variables
echo -e "\n===============================" >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "Script Name: $0">> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "Timestamp: $(date +%F:%T:%N)">> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "LOG_PATH SET: ${LOG_PATH} " >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "DEVICE_RULES_PATH SET: ${DEVICE_RULES_PATH}" >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "DEVICE_LOG_NAME: ${DEVICE_LOG_NAME}" >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "DEVICE_DRIVER_LOG_NAME: ${DEVICE_DRIVER_LOG_NAME}" >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "PATH_LOG_NAME: ${PATH_LOG_NAME}" >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "===============================\n" >> ${LOG_PATH}${PATH_LOG_NAME}
#ref: http://serverfault.com/a/126325
for dev in /sys/bus/usb/devices/*-*
do
    if [ -f $dev/bInterfaceClass ]; then 
        #check for interface class HID (0x03) keyboard protocol (0x01)
        if [[ "$(cat $dev/bInterfaceClass)" == "03" && "$(cat $dev/bInterfaceProtocol)" == "01" ]];then
            #strip device name (TODO set as varable of tmpfile)
            #ref: Linux and Unix shell programming David Tansley
            export DEVICE_DRIVER=$(basename ${dev})
            export DEVICE_DRIVER_LOG_NAME="device_driver.log"            
            export DEVICE_PATH="/sys/bus/usb/drivers/usbhid/"
            export DEVICE_LOG_NAME="keyboard_details.log"
         
            
            #check issues
            echo -e "\n===============================">> ${LOG_PATH}${DEVICE_LOG_NAME}
            echo -e "Script Name: $0">> ${LOG_PATH}${DEVICE_LOG_NAME}
            echo -e "Timestamp: $(date +%F:%T:%N)">> ${LOG_PATH}${DEVICE_LOG_NAME}
            echo -e "Device Driver Log Name: ${DEVICE_DRIVER_LOG_NAME}" >> ${LOG_PATH}${PATH_LOG_NAME}
            echo -e "Issue DEVICE_DRIVER name: ?????${DEVICE_DRIVER}">> ${LOG_PATH}${DEVICE_LOG_NAME}
            echo -e "===============================\n">> ${LOG_PATH}${DEVICE_LOG_NAME}
            #echo -e "\nENV: ";env
            echo -e "\n===============================">> ${LOG_PATH}${DEVICE_LOG_NAME}
            echo -e "Script Name: $0">> ${LOG_PATH}${DEVICE_LOG_NAME}
            echo -e "Timestamp: $(date +%F:%T:%N)">> ${LOG_PATH}${DEVICE_LOG_NAME}
            echo -e "Keyboard detected: $(basename ${dev})" >> ${LOG_PATH}${DEVICE_LOG_NAME}
            echo -e "Setting keyboard_flag to ONE: ${LOG_PATH}" >> ${LOG_PATH}${DEVICE_LOG_NAME}
            
            
            echo -e "${DEVICE_DRIVER}"> ${LOG_PATH}${DEVICE_DRIVER_LOG_NAME}
            #set flag
            echo 1 > ${LOG_PATH}keyboard_flag
            echo -e "===============================\n">> ${LOG_PATH}${DEVICE_LOG_NAME}
            
           
            echo "Check Interface Device driver: ${DEVICE_DRIVER}"
            echo "Check Interface Device path: ${DEVICE_PATH}"
            #maybe make a function for these exports
            #this is not exporting ti unbind??
            #export DEVICE_DRIVER
         
            
        #check for interface class HID (0x08) usb_storage protocol (0x50)
        elif [[ "$(cat $dev/bInterfaceClass)" == "08" && "$(cat $dev/bInterfaceProtocol)" == "50" ]]; then
            echo -e "\n===============================">> ${LOG_PATH}${DEVICE_LOG_NAME}
            echo -e "Script Name: $0">> ${LOG_PATH}${DEVICE_LOG_NAME}
            echo -e "Timestamp: $(date +%F:%T:%N)">> ${LOG_PATH}${DEVICE_LOG_NAME}
            echo -e "Flash drive detected: ${dev}">> ${LOG_PATH}${DEVICE_LOG_NAME}
            export DEVICE_DRIVER=$(basename ${dev})
            DEVICE_PATH="/sys/bus/usb/drivers/usb-storage/"
            DEVICE_LOG_NAME="flash_details.log"
            #set flag
            echo -e "Setting flash_flag to ONE: ${LOG_PATH}\n\n" >> ${LOG_PATH}${DEVICE_LOG_NAME}
            echo 1 > ${LOG_PATH}flash_flag
            echo -e "===============================\n">> ${LOG_PATH}${DEVICE_LOG_NAME}
           
            echo "Flash drive detected: $(basename ${dev})"
            echo "Device driver: ${DEVICE_DRIVER}"
            echo "Device path: ${DEVICE_PATH}"
        fi
        
        echo -e "\n=====================================">> ${LOG_PATH}${DEVICE_LOG_NAME}
        echo -e "Looping Through Devices">> ${LOG_PATH}${DEVICE_LOG_NAME}
        echo -e "Script Name: $0">> ${LOG_PATH}${DEVICE_LOG_NAME}
        echo -e "Timestamp: $(date +%F:%T:%N)">> ${LOG_PATH}${DEVICE_LOG_NAME}
        echo -e "Device Driver Log Name: ${DEVICE_DRIVER_LOG_NAME}" >> ${LOG_PATH}${PATH_LOG_NAME}
        echo -e "Issue DEVICE_DRIVER ??: ${DEVICE_DRIVER}">> ${LOG_PATH}${DEVICE_LOG_NAME}
        echo -e "=====================================\n">> ${LOG_PATH}${DEVICE_LOG_NAME}
    fi
done

exit 0
