#!/bin/bash
#
# USB Driveby Defender
#
# Check Interface
# This script is run to check the description
# of the device insertered and set flag
#---------------------
#check the path variables
echo -e "\nLOG_PATH SET ${LOG_PATH} \nIN $0 " >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "\nDEVICE_RULES_PATH SET ${DEVICE_RULES_PATH} \nIN $0 " >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "\nDEVICE_LOG_NAME ${DEVICE_LOG_NAME} \nIN $0 " >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "\nPATH_LOG_NAME ${PATH_LOG_NAME} \nIN $0 " >> ${LOG_PATH}${PATH_LOG_NAME}
#ref: http://serverfault.com/a/126325
for dev in /sys/bus/usb/devices/*-*
do
    if [ -f $dev/bInterfaceClass ]
    then 
        #check for interface class HID (0x03) keyboard protocol (0x01)
        if [[ "$(cat $dev/bInterfaceClass)" == "03" && "$(cat $dev/bInterfaceProtocol)" == "01" ]]
        then
            echo -e "DEV keyboard detected: $(basename ${dev})"
            #strip device name (TODO set as varable of tmpfile)
            #ref: Linux and Unix shell programming David Tansley
            export DEVICE_DRIVER=$(basename ${dev})
            DEVICE_PATH="/sys/bus/usb/drivers/usbhid/"
            DEVICE_LOG_NAME="keyboard_details.log"
             #set flag
             echo -e "Debug: Issue is DEVICE_LOG_NAME not exported back to the kernel "
             echo -e "\nNo issue here log path: ${LOG_PATH}"
             echo -e "\nIssue here device log name: ${DEVICE_LOG_NAME}"
             #echo -e "\nENV: ";env
             echo -e "\n\nSETTING keyboard_flag to ONE: ${LOG_PATH}\n\n" >> ${LOG_PATH}${DEVICE_LOG_NAME}
            echo 1 > ${LOG_PATH}keyboard_flag
            
            echo "keyboard detected: $(basename ${dev})" >> ${LOG_PATH}${DEVICE_LOG_NAME}
            echo "Check Interface Device driver: ${DEVICE_DRIVER}"
            echo "Check Interface Device path: ${DEVICE_PATH}"
            #maybe make a function for these exports
            #this is not exporting ti unbind??
            #export DEVICE_DRIVER
         
            
        #check for interface class HID (0x08) usb_storage protocol (0x50)
        elif [[ "$(cat $dev/bInterfaceClass)" == "08" && "$(cat $dev/bInterfaceProtocol)" == "50" ]]
        then
            echo "flash drive detected: ${dev}">> ${LOG_PATH}${DEVICE_LOG_NAME}
            DEVICE_DRIVER=$(basename ${dev})
            DEVICE_PATH="/sys/bus/usb/drivers/usb-storage/"
            #set flag
            echo -e "\n\nSETTING flash_flag to ONE: ${LOG_PATH}\n\n" >> ${LOG_PATH}${DEVICE_LOG_NAME}
            echo 1 > ${LOG_PATH}flash_flag
           
            echo "flash drive detected: $(basename ${dev})"
            echo "Device driver: ${DEVICE_DRIVER}"
            echo "Device path: ${DEVICE_PATH}"
        fi
        echo -e "\ntest at end of flow control condition in Check Interface script"
    fi
done

exit 0
