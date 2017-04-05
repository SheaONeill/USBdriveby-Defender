#!/bin/bash
#
# USB Driveby Defender
#
#
#---------------------

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


