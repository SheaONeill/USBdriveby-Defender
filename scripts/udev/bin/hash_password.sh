#!/bin/bash 
#
#Application:   USB Driveby Defender
#Authors:         Shea O'Neill, Paddy Cronan
#Date:              20/03/17
#Version:         1.0
#Title:               encrypt_password.sh
#Description:   This script hashes password
#------------------------------------------------------------

hash_password () {

   password=$(mkpasswd --method=sha-512 --salt=${admin_pass_1} ${user_pass_1} )
   echo -e "\nSalt: ${admin_pass_1} Hashed Password: ${password}"
      
}

#call hash_password function
hash_password 
