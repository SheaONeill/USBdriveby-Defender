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

 
    #sendmail
    echo -e "Attack Details\nID: ${user_id}\nDevice ID: ${device_id}" | mail -s "USB Attack " ${email1},${email2} -aFrom:'USBDriveby-Defender<a@a.a>'  -A ${LOG_PATH}${image}
    
}

#call contact_admin function
contact_admin


