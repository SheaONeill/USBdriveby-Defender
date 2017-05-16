#!/bin/bash 
#
#Application:   USB Driveby Defender
#Authors:         Shea O'Neill, Paddy Cronan
#Date:              20/03/17
#Version:         1.0
#Title:               check_password.sh
#Description:   This script hashes password
#                       and checks against user table
#-------------------------------------------------------------------------------------

ARGS=1
#this is for testing and is set in install script
SSMPT_PATH=$(find /etc/ -name ssmtp.conf)
SALT=$(grep -w 'AuthPass' ${SSMPT_PATH} | cut -d'=' -f2 )


check_password () {
   
    password=$(mkpasswd --method=sha-512 --salt=${SALT} $1 )
    #check against databse
    . /usr/local/bin/update_database.sh "check_password" "${HOME}" ".user_id" 
    if [ "${password}" != "$(<${HOME}/.password)" ];then
        echo -e "\nWrong Password"
    else
        echo -e "\nPassword $1 Matches $(<${HOME}/.password)"
        #unset flag        
        echo 0 > ${LOG_PATH}${FLAG}
    exit 0
    fi  
    
}

if [ $# -ne $ARGS ];then
    echo -e "\nUsage: $0 salt password arguments are not satisfied"
fi

#call encrypt_password function
check_password $1
