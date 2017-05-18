#!/bin/bash 
#
#Application:   USB Driveby Defender
#Authors:         Shea O'Neill, Paddy Cronan
#Date:              20/03/17
#Version:         1.0
#Title:              archive_logs.sh
#Description:  This script archives logs
#-----------------------------------------------------------

archive_logs () {
    
    while true; do
             read -p "Do you wish to archive logs (Y/N) " answer
             case ${answer} in
                #run command from log file if yes
                [Yy]* ) 
                    #archive logs
                    find ${LOG_PATH} -maxdepth 1 -mindepth 1 -type f -exec tar  zcvf "${LOG_PATH}$1_$(date '+%Y_%m_%d_%s%T').tar.gz" {} + 2>&1 > /dev/null
                    #ls ${LOG_PATH}logs/
                    #move archive and clear log dir
                    echo -e "\nArchiving logs............"
                    mv ${LOG_PATH}*.tar.gz ${LOG_PATH}logs
                    break;;
                [Nn]* ) 
                    ls ${LOG_PATH}
                    exit;;
                * ) echo -e "\nInvalid choice";;
            esac
        done  
        
        while true; do
             read -p "Do you wish to delete old logs (Y/N) " answer
             case ${answer} in
                #run command from log file if yes
                [Yy]* ) 
                    #delete logs including hidden
                    find ${LOG_PATH} -maxdepth 1 -mindepth 1 -type f -exec rm {} \; 
                    break;;
                [Nn]* ) 
                    exit;;
                * ) echo -e "\nInvalid choice";;
            esac
        done  
    
    
}

#call archive_logs function
archive_logs $1
