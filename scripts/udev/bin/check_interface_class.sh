#!/bin/bash
#
# USB Driveby Defender
#
# Check Interface
# This script is run to check the description
# of the device insertered and set flag
#---------------------

check_interface () {
    #ref: http://serverfault.com/a/126325
    for dev in /sys/bus/usb/devices/*-*
    do
        if [ -f $dev/bInterfaceClass ]; then 
            #check for interface class HID (0x03) keyboard protocol (0x01)
            if [[ "$(cat $dev/bInterfaceClass)" == "03" && "$(cat $dev/bInterfaceProtocol)" == "01" ]];then
                
                #ref: Linux and Unix shell programming David Tansley
                DEVICE_DRIVER=$(basename ${dev})
                #strore details of device in log file
                dmesg | grep $(echo "${DEVICE_DRIVER}" | cut -d: -f1) | grep Product | tail -n 3 > ${LOG_PATH}${DEVICE_LOG_NAME}
                      
                #store device driver node name in file 
                echo -e "${DEVICE_DRIVER}"> ${LOG_PATH}${DEVICE_DRIVER_LOG_NAME}
                #set flag
                echo 1 > ${LOG_PATH}${FLAG}
                            
                
            #check for interface class HID (0x08) usb_storage protocol (0x50)
            elif [[ "$(cat $dev/bInterfaceClass)" == "08" && "$(cat $dev/bInterfaceProtocol)" == "50" ]]; then

                #ref: Linux and Unix shell programming David Tansley
                DEVICE_DRIVER=$(basename ${dev})
                #strore details of device in log file
                dmesg | grep $(echo "${DEVICE_DRIVER}" | cut -d: -f1) | grep Product | tail -n 3 > ${LOG_PATH}${DEVICE_LOG_NAME}
                #store device driver node name in file 
                echo -e "${DEVICE_DRIVER}"> ${LOG_PATH}${DEVICE_DRIVER_LOG_NAME}
                #set flag
                echo 1 > ${LOG_PATH}${FLAG}

            fi
#testing
#udevadm info -q all -p /sys/bus/usb/devices/${DEVICE_DRIVER} >${LOG_PATH}getdetails.log
#udevadm monitor --property >${LOG_PATH}monitor.log
        fi
    done

}
#call check_interface
check_interface
source /usr/local/bin/log_details.sh $BASH_SOURCE "Checking_Interfaces"

