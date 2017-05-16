#!/bin/bash 
#
#Application:   USB Driveby Defender
#Authors:         Shea O'Neill, Paddy Cronan
#Date:              20/03/17
#Version:         1.0
#Title:              get_input.sh
#Description:  This script reads input and stores timings
#------------------------------------------------------------------------------

#initialise counter
count=1
#trap key
trap "authenticate_human" SIGINT SIGKILL SIGTERM SIGHUP

authenticate_human() {
    
    #read input for password
    read -s -p "Authenticate_human Enter Password: " pass
    #call password script
    . /usr/local/bin/check_password.sh $pass    
    trap "" 2 
    exit    
    
}	

read_input () {
   
    while true; do 
        input_char=$(dd bs=1 count=1 2>/dev/null; echo .);
        time_now=$(date  +%N)
       #check if first chracter is zero and add one
        if [ $(echo ${time_now} | head -c 1) -eq 0 ]; then time_now=1${time_now} ; fi
            #store time value in keystroke array
            keystroke[${count}]="$time_now"     
            #remove period
            input_char=${input_char%?} 	
            #check if newline or space character was entered
            if [ "$input_char" = $'\n' ]; 
                then newline=true
                #append newline and value
                echo -e "\n" >> ${LOG_PATH}${CHARACTER_LOG} 
                    if [  ${count} -gt 8 ] 
                        then
                        #call check_timings the dot preceding this runs this in the same shell
                        . /usr/local/bin/check_timings.sh
                    fi
            elif [ "$input_char" = " " ]; 
               then 
                #append newline and value
                echo -n " " >> ${LOG_PATH}${CHARACTER_LOG} 
            else
            #append $input_char no line breaks
            echo -n $input_char >> ${LOG_PATH}${CHARACTER_LOG}    
        fi
    #increment counter
    count=$(($count+1));   
done 

}

#call read_input function
read_input
