#!/bin/bash
#
# USB Driveby Defender
#
# Read Characters
# This script reads a single character from stdin
# and checks for line breaks
#---------------------

#check the path variables
echo -e "\nLOG_PATH SET ${LOG_PATH} \nIN Read Characters " >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "\nPATH_LOG_NAME ${PATH_LOG_NAME} \nIN Read Characters " >> ${LOG_PATH}${PATH_LOG_NAME}
read_char () {
    stty -icanon -echo 
	#period is appended, or command substitution will swallow a newline
	#ref: https://www.peterbe.com/plog/carriage-return-in-bash
	input_char=$(dd count=1 2>/dev/null; echo .)
	## Remove the period 	       
	input_char=${input_char%?} 	   
	#call check function
    check_enter_key 
	stty icanon echo
    }

#this function checks and sets if newline
check_enter_key () {
    if [ "$input_char" = $'\n' ]; 
        then newline=true
    fi
	}
	#


