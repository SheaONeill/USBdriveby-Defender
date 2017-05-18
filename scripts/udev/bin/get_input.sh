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
counter=1
source /usr/local/bin/authenticate_human.sh
#trap key
trap "authenticate_human" SIGINT SIGKILL SIGTERM SIGHUP
read_input () {

    #check database blacklist
    . /usr/local/bin/check_blacklist.sh   
    echo -e "\nBack in Get Input Authentication: ${authenticate}"    
    if [ "$authenticate" == "true" ]
        then 
            echo -e "\nExiting Get Input in 5 seconds"
            sleep 5
            #clear
            exit	  
    fi
    echo -e "\nEnter some text to test\n"  
    while true; do 
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
                        #call check_timings the dot preceding this runs this in the same shell
                        . /usr/local/bin/check_timings.sh
                        echo -e "\nExiting Get Input in 10 seconds"
                        sleep 10
                        #clear
                        exit	          
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
    counter=$(($counter+1));   
done 

}
#call read_input function
read_input


