#!/bin/bash
#
# USB Driveby Defender
#
# Set Rules for Remove
#---------------------

RULES_PATH="/etc/udev/rules.d/"
#check the path variables
echo -e "\nLOG_PATH SET ${LOG_PATH} \nIN $0 " >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "\nDEVICE_RULES_PATH SET ${DEVICE_RULES_PATH} \nIN $0 " >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "\nDEVICE_LOG_NAME ${DEVICE_LOG_NAME} \nIN $0 " >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "\nPATH_LOG_NAME ${PATH_LOG_NAME} \nIN $0 " >> ${LOG_PATH}${PATH_LOG_NAME}
#maybe use function for this need it for keyboard rules also
#collect all details of inserted device
set 2>&1 >> ${LOG_PATH}${DEVICE_LOG_NAME}
#get specific product details set variables
export ID_MODEL=$(set 2>&1 | grep -w 'ID_MODEL' | cut -d'=' -f2) 
export ID_MODEL_ID=$(set 2>&1 | grep -w 'ID_MODEL_ID' | cut -d'=' -f2)
export ID_VENDOR_ID=$(set 2>&1 | grep -w 'ID_VENDOR_ID' | cut -d'=' -f2)
echo "ID_VENDOR_ID is ${ID_VENDOR_ID}" >> ${LOG_PATH}${DEVICE_LOG_NAME}
#
#echo "Exiting before setting rules" >> ${LOG_PATH}${DEVICE_LOG_NAME}
#exit 0
#get model number and send it to remove in rules  file
sed -i '/ACTION=="remove"/ c\ACTION=="remove", ENV{ID_MODEL}=="'"${ID_MODEL}"'", RUN+="/usr/local/bin/usb_device_removed.sh" ' ${RULES_PATH}${DEVICE_RULES_PATH}
#reload rules so change will take affect
udevadm control --reload
##udevadm monitor --property #this will follow devices
echo "Done Here! $0" >> ${LOG_PATH}${DEVICE_LOG_NAME}

exit 0
 

