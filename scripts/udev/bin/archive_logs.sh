#!/bin/bash
#
# USB Driveby Defender
#
# Compress and delete logs
# 
# 
#---------------------

archive_logs () {
    
    #archive logs
    tar -zcvf "${LOG_PATH}$1_$(date '+%Y_%m_%d_%s%T').tar.gz" ${LOG_PATH}*  
    #move archive and clear log dir
    mv ${LOG_PATH}*.tar.gz ${LOG_PATH}logs/   && rm ${LOG_PATH}* 2> /dev/null       
}

#call record_logs function
archive_logs $1
