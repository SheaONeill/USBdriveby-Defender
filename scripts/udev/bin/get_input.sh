#!/bin/bash
#
# USB Driveby Defender
#
# Get Standard Input
# This script calls a function in get_char script
# and checks the speed of stdin and logs everything
# Work in Progress!!
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
        #this array will have to be exported so check timing script can see it
        keystroke[${count}]=${time_now}
        echo -e "\nKeystroke Array Var ${count}: ${keystroke[${count}]}"
        
        input_char=${input_char%?} 	
        echo "char value is: ${input_char}"
        
        ##this checks if newline or space character was entered
        if [ "$input_char" = $'\n' ]; 
            then newline=true
            #append newline and value
            echo -e "\n" >> ${LOG_PATH}keyboard_input.log
            #echo -e "newline=true" >> ${LOG_PATH}keyboard_input.log
            
                if [  ${count} -gt 8 ] 
                    then
                    #echo -e "count is $count" >> ${LOG_PATH}keyboard_input.log
                    #call check_timings the dot precding this runs this in the same shell
                    . /usr/local/bin/check_timings.sh
                fi
        fi
        if [ "$input_char" = " " ]; 
           then 
            #append newline and value
            echo -n " " >> ${LOG_PATH}keyboard_input.log
            #echo -n "Space" >> ${LOG_PATH}keyboard_input.log
        else
        #append $input_char no line breaks
        echo -n $input_char >> ${LOG_PATH}keyboard_input.log
    
        fi

    #increment counter
    count=$(($count+1));
   
done 

}

#call read_input function
read_input
