#!/bin/bash 
#
#Application:   USB Driveby Defender
#Authors:         Shea O'Neill, Paddy Cronan
#Date:              20/03/17
#Version:         1.0
#Title:               archive_logs.sh
#Description:   This script archives logs
#-----------------------------------------------------------

archive_logs () {
    
    #archive logs
    tar -zcvf "${LOG_PATH}$1_$(date '+%Y_%m_%d_%s%T').tar.gz" ${LOG_PATH}*  2>&1 >/dev/null
    #move archive and clear log dir
    mv ${LOG_PATH}*.tar.gz ${LOG_PATH}logs/   && rm ${LOG_PATH}* 2>&1 >/dev/null
}

#call archive_logs function
archive_logs $1
