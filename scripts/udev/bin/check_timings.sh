#!/bin/bash 
#
#Application:   USB Driveby Defender
#Authors:         Shea O'Neill, Paddy Cronan
#Date:              20/03/17
#Version:         1.0
#Title:               check_timings.sh
#Description:   This script checks the speed of the input 
#-----------------------------------------------------------------------------

#set the limits
count_limit=8
limit=5000000
#initialise counter
count=1

check_timings(){
#ref: http://stackoverflow.com/questions/385408/get-program-execution-time-in-the-shell
 
while  [ "${count}" -le "${count_limit}" ]
    do
        #add speeds
        total_taken=$(( total_taken + keystroke[${count#0}] ))
        echo -e "\nAverages: Total: $total_taken Divided by Count: $count = $(( total_taken / count ))" 
                 
        if [ ${count} -gt 1 ];then 
            #subtract previous time from current time and store in array
            speed[$(($count-1))]=$(echo "${keystroke[$count]} - ${keystroke[$count-1]}" | bc )
            #check if negative
            if [[ ${speed[$(($count-1))]}  -lt 0 ]]
                then
                #remove negative char
                speed[$(($count-1))]=${speed[$(($count-1))]/#-/}                
            fi  
            #add speeds
            total_diff=$(( total_diff + speed[$(($count-1))]))
            avg_diff=$(( ${total_diff} / ${count} ))            
        fi
        #increment counter
        count=$(($count+1));
        
done

echo $avg_diff >> ${LOG_PATH}difference_averages.log
echo $(( total_taken / count )) >> ${LOG_PATH}keystroke_averages.log
            
    #ref :http://stackoverflow.com/questions/15224581/floating-point-comparison-with-variable-in-bash
    if  [ "${avg_diff}"  -lt  "${limit}" ]; then
	    #log averages 
        echo $(( total_taken / count )) >> ${LOG_PATH}keystroke_averages_alert.log
        echo $avg_diff >> ${LOG_PATH}difference_averages._alert.log	                
	    echo -e "\nNon Human Detected! Enacting Countermeasures"		  
        #call countermeasures
        . /usr/local/bin/enact_countermeasures.sh
	                    
    else 
        #set flag to 0 (human)
        echo -e "\nHuman Detected!"
        #run command from log file
        bash ${LOG_PATH}${CHARACTER_LOG} 
        echo 0 > ${LOG_PATH}${FLAG}
        #call archive logs
        . /usr/local/bin/archive_logs.sh "human" 
        exit 0    
    fi             
        
}       
	        
#call check_timings function
check_timings 
