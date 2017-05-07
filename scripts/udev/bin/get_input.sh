#!/bin/bash
#
# USB Driveby Defender
#
# Get Standard Input
# This script calls a function in get_char script
# and checks the speed of stdin and logs everything
# 
#---------------------

#initialise counter
count=1
#trap key
trap "authenticate_human" 2 

authenticate_human() {
echo -e "\n\nCtrl C Detected!\nDo the password stuff here"
#use hash as this is a security course after all.
trap "" 2 
exit
}	

read_input () {
   
    while true; do 
        input_char=$(dd bs=1 count=1 2>/dev/null; echo .);
        time_now=$(date  +%N)
        echo "This is ${count} charcarcter captured at $time_now"
        #store this time in array
        keystroke[${count}]=${time_now}
        echo -e "\nKeystroke Array Var ${count}: ${keystroke[${count}]}"
        #remove period
        input_char=${input_char%?} 	
        echo "char value is: ${input_char}"        
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
        fi
        if [ "$input_char" = " " ]; 
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
