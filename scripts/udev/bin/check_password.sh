#!/bin/bash
#
# USB Driveby Defender
#
# check password
# 
#
#---------------------

ARGS=1
#this is for testing and is set in install script
SSMPT_PATH=$(find /etc/ -name ssmtp.conf)
SALT=$(grep -w 'AuthPass' ${SSMPT_PATH} | cut -d'=' -f2 )
echo -e "\nSalt :$SALT"
check_password () {
   
   password=$(mkpasswd --method=sha-512 --salt=${SALT} $1 )
   echo -e "\nSalt: ${SALT} Hashed Password: ${password}"
     
   #check against databse
    . /usr/local/bin/update_database.sh "check_password" "${HOME}" ".user_id" 
   if [ "${password}" != "$(<${HOME}/.password)" ];then
   echo -e "\nPassword $1Hashed ${password} from database :  $(<${HOME}/.password)"
    echo -e "\nWrong Password"
    echo "$(<${HOME}/.password)"
   
   else
   echo -e "\nPassword $1 Matches $(<${HOME}/.password)"
   
   fi
  
    
}

if [ $# -ne $ARGS ];then
    echo -e "\nUsage: $0 salt password arguments are not satisfied"
fi

#call encrypt_password function
check_password $1
