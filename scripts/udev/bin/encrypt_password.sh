#!/bin/bash
#
# USB Driveby Defender
#
# encrypt password
# 
#
#---------------------


encrypt_password () {
   # decryption=$(mkpasswd --method=sha-512 --salt=$SALT $1 )
   password=$(mkpasswd --method=sha-512 --salt=${admin_pass_1} ${user_pass_1} )
   echo -e "\nSalt: ${admin_pass_1} Hashed Password: ${password}"
   #to do this is temporary 
   #echo $password > ${LOG_PATH}.password
   
}

#call encrypt_password function
encrypt_password 
