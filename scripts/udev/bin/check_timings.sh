#!/bin/bash 
#
#Application:   USB Driveby Defender
#Authors:         Shea O'Neill, Paddy Cronan
#Date:              20/03/17
#Version:         1.0
#Title:              check_timings.sh
#Description:  This script checks the speed of the input 
#-----------------------------------------------------------------------------

#set the limits
count_limit=8
#0.3 seconds
limit=5000000
#initialise counter
counter=1

check_timings(){
#ref: http://stackoverflow.com/questions/385408/get-program-execution-time-in-the-shell
 
while  [ "${counter}" -le "${count_limit}" ]
    do
        #add speeds
        total_taken=$(( total_taken + keystroke[${counter#0}] ))                         
        if [ ${counter} -gt 1 ];then 
            #subtract previous time from current time and store in array
            speed[$(($counter-1))]=$(echo "${keystroke[$counter]} - ${keystroke[$counter-1]}" | bc )
            #check if negative
            if [[ ${speed[$(($counter-1))]}  -lt 0 ]]
                then
                #remove negative char
                speed[$(($counter-1))]=${speed[$(($counter-1))]/#-/}                
            fi  
            #add speeds
            total_diff=$(( total_diff + speed[$(($counter-1))]))
            avg_diff=$(( ${total_diff} / ${counter} ))     
        fi
        #increment counter
        counter=$(($counter+1));
        
done

echo $avg_diff >> ${LOG_PATH}difference_averages.log
echo $(( total_taken / counter )) >> ${LOG_PATH}keystroke_averages.log
            
    #ref :http://stackoverflow.com/questions/15224581/floating-point-comparison-with-variable-in-bash
    if  [ "${avg_diff}"  -lt  "${limit}" ]; then
	    #log averages 
        echo $(( total_taken / counter )) >> ${LOG_PATH}keystroke_averages_alert.log
        echo $avg_diff >> ${LOG_PATH}difference_averages._alert.log	                
	    echo -e "\nNon Human Detected! Enacting Countermeasures in 5 seconds"	
	    sleep 5
	    echo -e "\nIncoming speed ${avg_diff} is faster than limit ${limit} in 5 seconds" 
	    #run countermeasures in backgound possibly open in new terminal
        #gnome-terminal -e "/usr/local/bin/enact_countermeasures.sh" 
        . /usr/local/bin/enact_countermeasures.sh
        echo -e "\nExiting Main Check Timings"
       #clear
        exit	                    
    else 
        #set flag to 0 (human)
        echo -e "\nHuman Detected!"
        echo -e "\nIncoming speed ${avg_diff} is slower than limit ${limit} in 5 seconds"    	
       #ask before running
        while true; do
             read -p "Do you wish to run commands (Y/N) " answer
             case ${answer} in
                #run command from log file if yes
                [Yy]* ) 
                    bash ${LOG_PATH}${CHARACTER_LOG}
                    #flush character file
                    echo "" >${LOG_PATH}${CHARACTER_LOG}
                    break;;
                [Nn]* ) 
                #flush character file
                    echo "" >${LOG_PATH}${CHARACTER_LOG}
                    break;;
                * ) echo -e "\nInvalid choice";;
            esac
            
        done 
        #call get_input.sh
	    #if [[ "${authenticate}" == "true" ]]
            echo -e "\nResetting flag"   
            echo 0 > ${LOG_PATH}${FLAG}
            echo -e "\nCalling archive logs"
            #call archive logs commented out for testing
            . /usr/local/bin/archive_logs.sh "human" 
        #fi   
        echo -e "\nExiting Check Timings after Archving"
        #clear
        exit	           
    fi             
        
}       
	        
#call check_timings function
check_timings 
