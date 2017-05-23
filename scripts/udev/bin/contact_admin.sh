#!/bin/bash 
#
#Application:   USB Driveby Defender
#Authors:       Shea O'Neill, Paddy Cronan
#Date:          20/03/17
#Version:       1.0
#Title:         contact_admin.sh
#Description:  	This script is for running tests 
#-----------------------------------------------------------------------------
#trap key
source /usr/local/bin/authenticate_human.sh 
trap "authenticate_human" SIGINT SIGKILL SIGTERM SIGHUP 
#contact_admin
contact_admin(){

    #harcoded for testing and demo
    user_id="$(<$HOME/.user_id)"
    device_id="$(tail -n1 ${LOG_PATH}device_id.log)"
    #check if .keyboard_flag exists
    if [ ! -f "${LOG_PATH}${CHARACTER_LOG}" ]; then
    characters="Recurrence"
    else    
    characters="$(<${LOG_PATH}${CHARACTER_LOG})"
    fi
    ip=$(ip addr list wlan0 | grep "inet " | cut -d' ' -f6 | cut -d/ -f1)
    email1="<enter email here>"
    email2="<enter email here>"
    image="attacker.jpg"
    #sendmail
    echo -e "Attack Details\nIP Address: $ip\nID: ${user_id}\nDevice ID: ${device_id}\nAttack: ${characters}" | mail -s "USB Attack " ${email1},${email2} -aFrom:'USBDriveby-Defender<a@a.a>'  -A ${LOG_PATH}${image} 
    
}

#call contact_admin function
contact_admin


