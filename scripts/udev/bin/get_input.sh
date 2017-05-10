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
    read -s -p "Enter Password: " pass
    #call password script
    #todo creat hidden 
    . /usr/local/bin/check_password.sh $pass
trap "" 2 
exit
}	

read_input () {
   
    while true; do 
        input_char=$(dd bs=1 count=1 2>/dev/null; echo .);
        time_now=$(date  +%N)
        #time_now=$(date +%F\ %T\ %N)  
        #log this time for database (NOTE this is slowing dow speed and duck goes not fail test
        #maybe do this in check times!!!
        #if [ "${count}" -eq 1 ];
           # then
                # echo $(echo "$time_now" | cut -d' ' -f-1,2) >${LOG_PATH}datetime.log
        #fi    
        echo "This is ${count} charcarcter captured at ${time_now}"
        keystroke[${count}]="$time_now"     
        #strip the nanoseconds and store in array
        #keystroke[${count}]=$(echo "$time_now" | cut -d' ' -f3)      
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
