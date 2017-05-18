#!/bin/bash 
#
#Application:   USB Driveby Defender
#Authors:         Shea O'Neill, Paddy Cronan
#Date:              20/03/17
#Version:         1.0
#Title:              authenticate_human.sh
#Description:  This script authenticates the user
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
    #set colour to green,bold
    echo "$(tput setaf 2)"
    echo "$(tput bold)"
    echo -e "\n-----------------------------------------------------------------"           
    echo -e "     This text is displayed for demo purposes only"
    echo -e "-----------------------------------------------------------------\n"
    #reset colour
    echo "$(tput sgr0)"  
    while [ ${password_count} -le ${password_limit} ];
        do
            #read input for password
            echo -en "\nEnter "
            password=$(mkpasswd --method=sha-512 --salt=${SALT} $1 )
            #check against database
            . /usr/local/bin/update_database.sh "check_password" "${HOME}" ".user_id" 
            clear
            if [ "${password}" == "$(<${HOME}/.password)" ];then
                authenticate="true"
                #unset flag        
                echo 0 > ${LOG_PATH}${FLAG}
                #call archive logs 
                . /usr/local/bin/archive_logs.sh "human" 
                echo -e "\nAuthenticate Successfull exiting in 5 seconds..........."
                echo -e "\nAuthentication: ${authenticate}"
                echo -e "\npassword_count: ${password_count}"
                echo -e "\nPID:: $!"
                exit	          
            else
                #set colour to green,bold
                echo "$(tput setaf 1)"
                echo "$(tput bold)"
                echo -e "\nWrong Password $(echo "$password_limit-$password_count" | bc ) tries left!" 
                #reset colour
                echo "$(tput sgr0)"  
                #increment counter
                password_count=$(($password_count+1));   
                authenticate="false"       
            fi  
      
    done  
    
    if  [ "${password_count}" -ge 3 ] && [ "${authenticate}" == "false" ]
        then
        password_count=1
        echo -e "\nAuthentication: ${authenticate}"
        echo -e "\npassword_count: ${password_count}"
        echo -e "\nPID:: $!"
        echo -e "\nCountermeasures in 5 seconds..........."
        sleep 5
        read -p "exit? " answer
        #clear
        #call countermeasures
        read -p "\nAuthentication Fail Hit enter for countermeasures" abc	      
        #call countermeasures
        . /usr/local/bin/enact_countermeasures.sh
        #echo -e "\nAuthentication: ${authenticate}"
        echo -e "\nBack From Countermeasures in 5 seconds..........."
        echo -e "\nAuthentication: ${authenticate}"
        echo -e "\npassword_count: ${password_count}"
        echo -e "\nPID:: $!"
        exit	    
    fi    

    echo -e "\nAuthenticate From Countermeasures Exitingl in 5 seconds..........."
    sleep 5
    #clear
    exit	          
}	
#set colour to green,bold
echo "$(tput setaf 2)"
echo "$(tput bold)"
echo -e "\n-----------------------------------------------------------------"           
echo -e "     This text is displayed for demo purposes only"
echo -e "-----------------------------------------------------------------\n"
#reset colour
echo "$(tput sgr0)"         

