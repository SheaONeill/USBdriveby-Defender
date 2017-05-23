#!/bin/bash 
#
#Application:   USB Driveby Defender
#Authors:         Shea O'Neill, Paddy Cronan
#Date:              20/03/17
#Version:         1.0
#Title:               setup_database.shis for tests
#--------------------------------------------------------------------


    #get user name
    read -p "Enter User Name: " user_name
    #get user email
    read -p "Enter User Email: " user_email
    while true;do
        #get user password
        read -s -p "Enter User Password: " user_pass_1
        #check than lenght is greater than eight
        if  ! [[ "${#user_pass_1}" -ge 8 ]]
            then 
            echo -e "\npassword must be at least 8 characters"
        #check that password contains upppercase,lowercase and numeric character
        elif ! [[ "${user_pass_1}" == *[a-z]* && "${user_pass_1}" == *[A-Z]* && "${user_pass_1}" == *[0-9]* ]]
            then 
            echo -e "\nPassword must contain upppercase,lowercase and numeric characters"
        else    
            read -s -p "Confirm User Password: " user_pass_2
            if [ "${user_pass_1}" != "${user_pass_2}" ];
            then
                echo -e "Passwords do not match"
                else break;
            fi       
        fi       
        
    done



