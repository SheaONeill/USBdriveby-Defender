#!/bin/bash
#
# USB Driveby Defender
#
# Read Characters
# This script reads a single character from stdin
# and checks for line breaks
#---------------------
#trap "authenticate_human" 2 3 15
trap "authenticate_human" 2 
#check the path variables
#echo -e "\nLOG_PATH SET ${LOG_PATH} \nIN Read Characters " >> ${LOG_PATH}${PATH_LOG_NAME}
#echo -e "\nPATH_LOG_NAME ${PATH_LOG_NAME} \nIN Read Characters " >> ${LOG_PATH}${PATH_LOG_NAME}
read_char () {
    echo -e "\nIn get_char Function"
    echo -e "\nCount: ${count}"
    stty -icanon -echo 
	#period is appended, or command substitution will swallow a newline
	#ref: https://www.peterbe.com/plog/carriage-return-in-bash
	input_char=$(dd bs=1 count=1 2>/dev/null; echo .)
	## Remove the period 	       
	input_char=${input_char%?} 	
	#call check_time
	#get_time 
	#call check_timings
    #maybe this should be in get char
    /usr/local/bin/check_timings.sh
	#call check_enter_key function
    check_character_key 
	stty icanon echo
    }

#this function checks and sets if newline or space character
check_character_key () {
    if [ "$input_char" = $'\n' ]; 
        then newline=true
    fi
    if [ "$input_char" = " " ]; 
    then space=true
    fi
	}

authenticate_human() {
echo -e "\n\nCtrl C Detected!\nDo the password stuff here"
#use hash as this is a security course after all.
trap "" 2 
stty icanon echo
exit 2
}	










