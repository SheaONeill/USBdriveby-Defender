#!/bin/bash 
#
#Application:		USB Driveby Defender
#Authors:		Shea O'Neill, Paddy Cronan
#Date:			20/03/17
#Version:		1.0
#Title:			archive_logs.sh
#Description:		This script archives logs
#-----------------------------------------------------------

archive_logs () {
    
    #archive logs
    find ${LOG_PATH} -maxdepth 1 -mindepth 1 -type f -exec tar  zcvf "${LOG_PATH}$1_$(date '+%Y_%m_%d_%s%T').tar.gz" {} + &> /dev/null
    mv ${LOG_PATH}*.tar.gz ${LOG_PATH}logs &> /dev/null
  
    #delete logs including hidden
    find ${LOG_PATH} -maxdepth 1 -mindepth 1 -type f -exec rm {} \;  &> /dev/null
    
}

#call archive_logs function
archive_logs $1
