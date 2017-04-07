#!/bin/bash
#
# USB Driveby Defender
#
# Check Interface
#---------------------
#check the log path variable
echo "pickedup log path in $0 from ${LOG_PATH}" >> ${LOG_PATH}${PATH_LOG_NAME}
#ref: http://serverfault.com/a/126325
for dev in /sys/bus/usb/devices/*-*
do
    if [ -f $dev/bInterfaceClass ]
    then 
        #check for interface class HID (0x03) keyboard protocol (0x01)
        if [[ "$(cat $dev/bInterfaceClass)" == "03" && "$(cat $dev/bInterfaceProtocol)" == "01" ]]
        then
            echo "keyboard detected: ${dev}"
            #strip device name (TODO set as varable of tmpfile)
            #ref: Linux and Unix shell programming David Tansley
            DEVICE_DRIVER=$(basename ${dev})
            DEVICE_PATH="/sys/bus/usb/drivers/usbhid/"
             #set flag
             echo "SETTING keyboard_flag to ONE: ${LOG_PATH}" >> ${LOG_PATH}${DEVICE_LOG_NAME}
            echo 1 > ${LOG_PATH}keyboard_flag
            
            echo "keyboard detected: $(basename ${dev})"
            echo "Device driver: ${DEVICE_DRIVER}"
            echo "Device path: ${DEVICE_PATH}"
            
        #check for interface class HID (0x08) usb_storage protocol (0x50)
        elif [[ "$(cat $dev/bInterfaceClass)" == "08" && "$(cat $dev/bInterfaceProtocol)" == "50" ]]
        then
            echo "flash drive detected: ${dev}"
            DEVICE_DRIVER=$(basename ${dev})
            DEVICE_PATH="/sys/bus/usb/drivers/usb-storage/"
            #set flag
            echo "SETTING flash_flag to ONE: ${LOG_PATH}" >> ${LOG_PATH}${DEVICE_LOG_NAME}
            echo 1 > ${LOG_PATH}flash_flag
           
            echo "flash drive detected: $(basename ${dev})"
            echo "Device driver: ${DEVICE_DRIVER}"
            echo "Device path: ${DEVICE_PATH}"
        fi
        echo "test"
    fi
done

exit 0
