#!/bin/bash 
#
#Application:   USB Driveby Defender
#Authors:	Shea O'Neill, Paddy Cronan
#Date:		20/03/17
#Version:       1.0
#Title:         authenticate_human.sh
#Description:  	This script authenticates the user
#-------------------------------------------------------------------------------------
#trap key
trap "authenticate_human" SIGINT SIGKILL SIGTERM SIGHUP 

SSMPT_PATH=$(find /etc/ -name ssmtp.conf)
SALT=$(grep -w 'AuthPass' ${SSMPT_PATH} | cut -d'=' -f2 )

authenticate_human() {
    
    SSMPT_PATH=$(find /etc/ -name ssmtp.conf)
    SALT=$(grep -w 'AuthPass' ${SSMPT_PATH} | cut -d'=' -f2 )
    password_count=1
    password_limit=3
    while  [ "${authenticate}" != "true" ];
        do
                   
            #read and hash password
            password=$(mkpasswd --method=sha-512 --salt=${SALT} $1 )
            #check hash against database
            /usr/local/bin/update_database.sh "check_password" "${HOME}" ".user_id" 
            #set colour to red,bold
            clear
            echo -en "\n$(tput setaf 1)$(tput bold)root@Shea$(tput sgr0):$(tput setaf 11)~$(tput sgr0)#"
            if [ "${password}" == "$(<${HOME}/.password)" ];then
                export authenticate="true"
                #unset flag        
                echo 0 > ${LOG_PATH}${FLAG}
                #compress and archive logs 
                /usr/local/bin/archive_logs.sh "non-human"  
                echo -e "\n$(tput setaf 10)$(tput bold)Authentication Successful!$(tput sgr0)"
                exit           
                 
            elif [ "${password}" != "$(<${HOME}/.password)" ];then    
                #set colour to red,bold
                clear        
                echo -e "\n$(tput setaf 1)$(tput bold)Wrong Password attempts left: $(echo "$password_limit-$password_count" | bc )$(tput sgr0)" 
                export authenticate="false"    
                if  [ "${password_count}" -ge 3 ] && [ "${authenticate}" == "false" ]
                    then
                    #reset count
                    password_count=1
                    #lockdown and set alarm
                    /usr/local/bin/lock_down.sh && /usr/local/bin/sound_alarm.sh
               fi                 
            fi  
        #increment counter
        password_count=$(($password_count+1));  
    done  
exit
}	

