#!/bin/bash
#
# USB Driveby Defender
#
# Get User Details
#
# 
# 
#---------------------

get_user_info () {
    #get admin email and save to file
    read -p "Enter Admin AuthUser Email: " admin_email
    echo ${admin_email}
    #application password for smpt server store in file encrypt file
    while true;do
        read -s -p "Enter Admin AuthPass: " admin_pass_1
        echo ${admin_pass_1}
        read -s -p "Confirm Admin AuthPass: " admin_pass_2
         echo ${admin_pass_2}
        if [ ${admin_pass_1} != ${admin_pass_2} ];
        then
            echo -e "\nPasswords do not match\n"
            else 
            #call config_defender
            . ./config_defender.sh
            break;
        fi
    done
    
    #get user name
    read -p "Enter User Name: " user_name
    echo ${user_name}
    #get user email
    read -p "Enter User Email: " user_email
    echo ${user_email}
    while true;do
        read -s -p "Enter User Password: " user_pass_1
        echo ${user_pass_1}
        read -s -p "Confirm User Password: " user_pass_2
        echo ${user_pass_2}
        if [ ${user_pass_1} != ${user_pass_2} ];
        then
            echo -e "Passwords do not match"
            else break;
        fi
    done
    
    #encrypt_password.sh
    . .././encrypt_password.sh
   
   #add to user table
    . /usr/local/bin/update_database.sh "add_user" "${user_name}" "${password}" "${user_email}"
     #should have user id now
    echo "User ID From Database $(<${HOME}/.user_id)"
    
}

#get_user_info function
get_user_info
