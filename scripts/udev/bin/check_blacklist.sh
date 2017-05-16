#!/bin/bash 
#
#Application:   USB Driveby Defender
#Authors:         Shea O'Neill, Paddy Cronan
#Date:              20/03/17
#Version:         1.0
#Title:               check_blacklist.sh
#Description:   This script adds attack device to blacklist 
#------------------------------------------------------------------------------

check_blacklist () {

    #check database blacklist
    . /usr/local/bin/update_database.sh "check_database" "${LOG_PATH}" "blacklisted.log"
    
    #check if device_id.log exists
    if [ -f ${LOG_PATH}blacklisted.log ]; then 
        
        #check if device_id.log is empty
        if [[ -s ${LOG_PATH}blacklisted.log ]];then
           #call countermeasures
            . /usr/local/bin/enact_countermeasures.sh  
        fi
        
    fi      
}

#call check _blacklist function
check_blacklist
