#!/bin/bash
#
# USB Driveby Defender
#
# Set Rules for Remove
# This script inserts the model name
# into the rules for the specific device
# note this was necessary otherwise
# the rule wouldn't trigger
#---------------------

RULES_PATH="/etc/udev/rules.d/"
#check the path variables
echo -e "\n===============================" >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "Script Name: $0">> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "Timestamp: $(date +%F:%T:%N)">> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "LOG_PATH SET: ${LOG_PATH} " >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "DEVICE_RULES_PATH SET: ${DEVICE_RULES_PATH} " >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "DEVICE_LOG_NAME: ${DEVICE_LOG_NAME}" >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "Device Driver Log Name: ${DEVICE_DRIVER_LOG_NAME}" >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "PATH_LOG_NAME: ${PATH_LOG_NAME}" >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "===============================\n" >> ${LOG_PATH}${PATH_LOG_NAME}
#maybe use function for this need it for keyboard rules also
#collect all details of inserted device
echo -e "\n===============================" >> ${LOG_PATH}${DEVICE_LOG_NAME}
echo -e "Device Details Full" >> ${LOG_PATH}${DEVICE_LOG_NAME}
set 2>&1 >> ${LOG_PATH}${DEVICE_LOG_NAME}
unset 2>&1 >> /dev/null
echo -e "\n===============================" >> ${LOG_PATH}${DEVICE_LOG_NAME}
#get specific product details set variables
export ID_MODEL=$(set 2>&1 | grep -w 'ID_MODEL' | cut -d'=' -f2) 
export ID_MODEL_ID=$(set 2>&1 | grep -w 'ID_MODEL_ID' | cut -d'=' -f2)
export ID_VENDOR_ID=$(set 2>&1 | grep -w 'ID_VENDOR_ID' | cut -d'=' -f2)
echo -e "\n===============================" >> ${LOG_PATH}${DEVICE_LOG_NAME}
echo -e "Get Specifics">> ${LOG_PATH}${DEVICE_LOG_NAME}
echo -e "Script Name: $0">> ${LOG_PATH}${DEVICE_LOG_NAME}
echo -e "Timestamp: $(date +%F:%T:%N)">> ${LOG_PATH}${DEVICE_LOG_NAME}
echo -e "ID_MODEL: ${ID_MODEL}" >> ${LOG_PATH}${DEVICE_LOG_NAME}
echo -e "ID_MODEL_ID: ${ID_MODEL_ID}" >> ${LOG_PATH}${DEVICE_LOG_NAME}
echo -e "ID_VENDOR_ID: ${ID_VENDOR_ID}" >> ${LOG_PATH}${DEVICE_LOG_NAME}
echo -e "Device Driver Log Name: ${DEVICE_DRIVER_LOG_NAME}" >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "Issue DEVICE_DRIVER name:????????? ${DEVICE_DRIVER}">> ${LOG_PATH}${DEVICE_LOG_NAME}
echo -e "About to set new remove rule" >> ${LOG_PATH}${DEVICE_LOG_NAME}
echo -e "===============================\n" >> ${LOG_PATH}${DEVICE_LOG_NAME}
#
#get model number and send it to remove in rules  file
sed -i '/ACTION=="remove"/ c\ACTION=="remove", ENV{ID_MODEL}=="'"${ID_MODEL}"'", RUN+="/usr/local/bin/usb_device_removed.sh" ' ${RULES_PATH}${DEVICE_RULES_PATH}
#reload rules so change will take affect
udevadm control --reload
##udevadm monitor --property #this will follow devices use this for demo
echo -e "\n===============================" >> ${LOG_PATH}${DEVICE_LOG_NAME}
echo -e "Script Name: $0">> ${LOG_PATH}${DEVICE_LOG_NAME}
echo -e "Timestamp: $(date +%F:%T:%N)">> ${LOG_PATH}${DEVICE_LOG_NAME}
echo -e "Done Here! $0" >> ${LOG_PATH}${DEVICE_LOG_NAME}
echo -e "===============================\n" >> ${LOG_PATH}${DEVICE_LOG_NAME}

exit 0
 

