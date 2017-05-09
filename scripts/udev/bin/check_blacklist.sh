#!/bin/bash
#
# USB Driveby Defender
#
# Check Databse Blacklist
# This script calls update_database.sh
# and passes three arguments
# 
#---------------------


check_blacklist () {

    #check database blacklist
    . /usr/local/bin/update_database.sh "check_database" "${LOG_PATH}" "blacklisted.log"
    
    #check if device_id.log exists
    if [ -f ${LOG_PATH}blacklisted.log ]; then 
        
        #check if device_id.log is empty
        if [[ -s ${LOG_PATH}blacklisted.log ]];then
           #call countermeasures
            . /usr/local/bin/countermeasures.sh  
        fi
        
    fi      
}

#call check _blacklist function
check_blacklist
