#!/bin/bash
#
# USB Driveby Defender
#
# check password
# 
#
#---------------------

#expect 4 arguments  
ARGS=2
SALT=${admin_pass_1}
encrypt_password () {
   # decryption=$(mkpasswd --method=sha-512 --salt=$SALT $1 )
   password=$(mkpasswd --method=sha-512 --salt=${SALT} $1 )
   echo -e "\nSalt: ${SALT} Hashed Password: ${password}"
   #to do this is temporary 
   echo $password > ${LOG_PATH}.password
   if [ "${password}" != "$(<${LOG_PATH}.password)" ];then
    echo $password
    echo -e "\nWrong Password"
    echo "$(<${LOG_PATH}.password)"
   
   else
   echo -e "\nFix this"
   fi
    
    #finish this
    #echo $decryption > ${LOG_PATH}.password
    
}

if [ $# -ne $ARGS ];then
    echo -e "\nUsage: $0 salt password arguments are not satisfied"
fi

#call encrypt_password function
encrypt_password $1 $2
