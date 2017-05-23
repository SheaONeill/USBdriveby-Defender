#!/bin/bash 
#
#Application:   USB Driveby Defender
#Authors:       Shea O'Neill, Paddy Cronan
#Date:          20/03/17
#Version:       1.0
#Title:         get_input.sh
#Description:  	This script reads input and stores timings
#------------------------------------------------------------------------------

#initialise variables
counter=1
target="false"
source /usr/local/bin/authenticate_human.sh
#trap key
trap "authenticate_human" SIGINT SIGKILL SIGTERM SIGHUP
read_input () {
    
    while [ "${target}" != "true" ]; do 
        input_char=$(dd bs=1 count=1 2>/dev/null; echo .);
        time_now=$(date  +%N)
       #check if first chracter is zero and add one
        if [ $(echo ${time_now} | head -c 1) -eq 0 ]; then time_now=1${time_now} ; fi
        #store time value in keystroke array
        keystroke[${counter}]="$time_now"     
        #remove period
        input_char=${input_char%?} 	
        #check if newline or space character was entered
        if [ "$input_char" = $'\n' ]; 
            then newline=true
            #append newline and value
            echo -e "\n" >> ${LOG_PATH}${CHARACTER_LOG} 
                if [  ${counter} -gt 8 ] 
                    then
                    target="true"
                    #call check_timings the dot preceding this runs this in the same shell
                     . /usr/local/bin/check_timings.sh
                    exit           
                fi
            elif [ "$input_char" = " " ]; 
               then 
                #append newline and value
                echo -n " " >> ${LOG_PATH}${CHARACTER_LOG}            
        fi
        #append $input_char no line breaks
       
        echo -n $input_char >> ${LOG_PATH}${CHARACTER_LOG}    
    #increment counter
    counter=$(($counter+1));   
done 

}
#set colour to red,bold
clear
echo -en "$(tput setaf 1)$(tput bold)root@Shea$(tput sgr0):$(tput setaf 11)~$(tput sgr0)#"
#call read_input function
read_input


