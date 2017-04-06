#!/bin/bash
#
# USB Driveby Defender
#
#
#---------------------

#set the log path variable
LOG_PATH="/var/log/driveby_defender/"
lim=.003300000

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
    
    #test    
    #echo input_char value
    echo "got $input_char"
    echo "char value is: ${input_char}"




    #ref: http://stackoverflow.com/questions/385408/get-program-execution-time-in-the-shell
    #note this is speed of single character not full word
    #need to check after enter signal is confirmed and then calculate
    dur=$(echo "$(date +%s.%N) - $start" | bc)
    printf "Execution time: %.6f seconds" $dur
    #ref :http://stackoverflow.com/questions/15224581/floating-point-comparison-with-variable-in-bash
	if (( $(echo "${dur} < ${lim}" | bc -l) )); then
	#if (( $(echo "$dur" < "$lim" | bc -l) )); then
	#
	#this is where alerts happen (a function from another scirpt can be called here
	#or just call script itself (choices choices)
	#contact admin
	#take photo
	#upload captured details to server in case system gets compromised
	#run a check on all opened ports and shut them down where applicable
	#check captured commands and compare against known scripts
	#lock down
	#
	##this will lock the screen on gnome (more research for other desktops eg KDE)
    #checkout dbus.freegesktop.org for dbus specs (interprocess communication)
    #uncomment this next line
    #dbus-send --type=method_call --dest=org.gnome.ScreenSaver /org/gnome/ScreenSaver org.gnome.ScreenSaver.Lock
	#
    	echo -e "speed ${dur} is less than ${lim}"
    	echo -e "\nNon Human Detected!"
		if [ -f ${LOG_PATH}keyboard_flag ]; then
			echo "resetting keyboard_flag to 1"
			#set flag to 1 (non-human)
			echo 1 > ${LOG_PATH}keyboard_flag
		else
		echo -e "\nno keyboard_flag file found"	
	fi
	
else echo -e "speed ${dur} is greater than ${lim}";
    #set flag to 0 (human)
    echo -e "\nHuman Detected!"
    echo 0 > ${LOG_PATH}keyboard_flag

fi

    #pipe standard input into loop	
    done #< /dev/stdin <-not necessary using dd


