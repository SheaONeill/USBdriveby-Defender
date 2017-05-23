#!/bin/bash 
#
#Application:   USB Driveby Defender
#Authors:       Shea O'Neill, Paddy Cronan
#Date:          20/03/17
#Version:       1.0
#Title:         check_timings.sh
#Description:  	This script checks the speed of the input 
#-----------------------------------------------------------------------------

#set the limits
count_limit=8
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
	    . /usr/local/bin/enact_countermeasures.sh
       exit   	                    
    else 
        bash ${LOG_PATH}${CHARACTER_LOG} 2>/dev/null
        #clear log
        echo "" >${LOG_PATH}${CHARACTER_LOG}
        #reset flag"   
        echo 0 > ${LOG_PATH}${FLAG}
        #archive logs
        . /usr/local/bin/archive_logs.sh "human"  
                 
    fi             
        
}       
	        
#call check_timings function
check_timings 
