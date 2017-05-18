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
    clear
    #check if device_id.log exists
    if [ -f ${LOG_PATH}blacklisted.log ]; then 
        
        #check if device_id.log is empty
        if [[ -s ${LOG_PATH}blacklisted.log ]];then
            #trap source
            source /usr/local/bin/authenticate_human.sh
            #trap key 
            trap "authenticate_human" SIGINT SIGKILL SIGTERM SIGHUP
           #call countermeasures
            read -p "\nFound in Blacklist Hit enter for countermeasures" abc	
            . /usr/local/bin/enact_countermeasures.sh
            echo -e "\nExiting Check Blacklist in 5 seconds"
            sleep 5
            read -p "press enter to exit " answer
            #clear
            exit	          
        fi
        
    fi      
}

#call check _blacklist function
check_blacklist
