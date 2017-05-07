#!/bin/bash
#
# USB Driveby Defender
#
# Get Standard Input
# This script calls a function in get_char script
# and checks the speed of stdin and logs everything
# Work in Progress!!
#---------------------

#check the path variables
#echo -e "\nLog Path Set${LOG_PATH} \nIn Get Standard Input " >> ${LOG_PATH}${PATH_LOG_NAME}
#echo -e "\nPath Log Name ${PATH_LOG_NAME} \nIn Get Standard Input " >> ${LOG_PATH}${PATH_LOG_NAME}
export count=1
#fix this limit when speed is sorted
lim=2363480
diff_limit=300000
newline="false"
space="false"
#start=$(date  +%N)
read_input () {
    check_read_input_time=$(date  +%N)
    echo -e "\nIn read_input Function time is now: $check_read_input_time"
    echo -e "\nCount: is now: ${count}"
    #echo input_char value
    echo "char value is: ${input_char}"
#read and loop until <ctrl><d> or exit
while read_char input_char; do
    check_while_loop_time=$(date  +%N)
    echo -e "\nIn While loop Function time is now: $check_while_loop_time"
    echo -e "\nCount: is now: ${count}"
    #echo input_char value
    echo "char value is: ${input_char}"
    
    #call check_timings
    #maybe this should be in get char
    #/usr/local/bin/check_timings.sh
    
    #this checks if newline or space character was entered
    check_character_key
    if [ "$newline" = "true" ]; 
        then 
        #append newline and value
        echo -e "\n" >> ${LOG_PATH}keyboard_input.log
        #echo '\n' >> ${LOG_PATH}keyboard_input.log
        #reset bool
        newline="false"
     elif [ "$space" = "true" ]; 
        then 
        #append newline and value
        echo -n " " >> ${LOG_PATH}keyboard_input.log
        #reset bool
        space="false"
    else
        #append $input_char no line breaks
        echo -n $input_char >> ${LOG_PATH}keyboard_input.log
    
    fi
    
    

#increment counter
    count=$(($count+1));
   check_count_incremented_time=$(date  +%N)
   echo -e "\nFirst loop done count is incremented time is Now:  $check_count_incremented_time"
   echo -e "Count: is now: ${count}"
   #echo input_char value
    echo "char value is: ${input_char}"

done 


}

#call function from external script
#source /usr/local/bin/get_char.sh
read_char () {
    check_read_char_time=$(date  +%N)
   echo -e "\nIn read_char_char_key Function time is Now: $check_read_char_time"
   echo -e "Count: is now: ${count}"
   #echo input_char value
    echo "char value is: ${input_char}"
    
    stty -icanon -echo 
	#period is appended, or command substitution will swallow a newline
	#ref: https://www.peterbe.com/plog/carriage-return-in-bash
	input_char=$(dd bs=1 count=1 2>/dev/null; echo .)
	## Remove the period 	       
	input_char=${input_char%?} 	
	#call check_time
	#get_time 
	#call check_timings
    before_check_timings_time=$(date  +%N)
    echo -e "\nIn heading to check_timings Function time is Now: $before_check_character_key_time"
    echo -e "Count: is now: ${count}"
    #echo input_char value
    echo "char value is: ${input_char}"
    echo "This is ${count} charcarcter captured at $before_check_timings_time"
    /usr/local/bin/check_timings.sh "start=$(date  +%N)"
	#call check_enter_key function
	before_check_character_key_time=$(date  +%N)
    echo -e "\nIn heading to check_character_key Function time is Now: $before_check_character_key_time"
    echo -e "Count: is now: ${count}"
    #echo input_char value
    echo "char value is: ${input_char}"
    echo "This is ${count} charcarcter captured at $before_check_character_key_time"
    check_character_key 
	stty icanon echo
}

#this function checks and sets if newline or space character
check_character_key () {
    check_character_key_time=$(date  +%N)
    echo -e "\nIn check_character_key Function time is Now: $check_character_key_time"
    echo -e "Count: is now: ${count}"
    #echo input_char value
    echo "char value is: ${input_char}"
    
    if [ "$input_char" = $'\n' ]; 
        then newline=true
    fi
    if [ "$input_char" = " " ]; 
    then space=true
    fi
	}

#call read_input function
read_input
