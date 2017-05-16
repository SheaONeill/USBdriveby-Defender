#!/bin/bash 
#
#Application:   USB Driveby Defender
#Authors:         Shea O'Neill, Paddy Cronan
#Date:              20/03/17
#Version:         1.0
#Title:              contact_admin.sh
#Description:  This script is for running tests 
#-----------------------------------------------------------------------------

#contact_admin
contact_admin(){

    #harcoded for testing and demo
    user_id="$(<$HOME/.user_id)"
    device_id="$(tail -n1 ${LOG_PATH}device_id.log)"
    email1="b00084432@gmail.com"
    email2="jamesoneill14@whitehallcollege.com"
    image="00000005.jpg"
    #sendmail
    echo -e "Attack Details\nID: ${user_id}\nDevice ID: ${device_id}" | mail -s "USB Attack " ${email1},${email2} -aFrom:'USBDriveby-Defender<a@a.a>'  -A ${LOG_PATH}${image}
    
}

#call contact_admin function
contact_admin


