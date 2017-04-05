#!/bin/bash
#
# USB Driveby Defender
#
#
#---------------------

#set the log path variable
LOG_PATH="/var/log/driveby_defender/"
lim=.003300000
#

#call function from external script
source /usr/local/bin/get_char.sh

#read and loop until <ctrl><d> or exit
while read_char input_char; do
    
    #set the start time variable
    start=$(date +%s.%N)
    #this checks for a newline
    check_enter_key
    if [ "$newline" = "true" ]; 
        then input_char="\nENTER"
        #append newline and value
        echo -e $input_char >> ${LOG_PATH}keyboard_input.log
        #reset bool
        newline="false"
    else
        #append $input_char no line breaks
        echo -n $input_char >> ${LOG_PATH}keyboard_input.log
    
    fi
    
    
    
    #echo input_char value
    echo "got $input_char"
    echo "char value is: ${input_char}"




    #ref:http://stackoverflow.com/questions/385408/get-program-execution-time-in-the-shell
    dur=$(echo "$(date +%s.%N) - $start" | bc)
    printf "Execution time: %.6f seconds" $dur
    #strip off decimal %.* without this invalid arithmetic operator (error token is ".00")
	if (( ${dur} < ${lim} | bc -l )); then
	#if (( $(echo "$dur" < "$lim" | bc -l) )); then
    	echo -e "speed ${dur} is less than ${lim}"
		#setlog path variable
		LOG_PATH="/var/log/driveby_defender/"
		if [ -f ${LOG_PATH}keyboard.log ]; then
			echo "removing keyboard.log"
			echo -e "\nPress any key"; read a
			rm ${LOG_PATH}keyboard.log
		else
		echo -e "\nno keyboard.log file found"	
	fi
	
else echo -e "speed ${dur} is greater than ${lim}";
echo "(( $(echo "$dur" <= "$lim" | bc -l) ))"
fi



    #pipe standard input into loop	
    done #< /dev/stdin


