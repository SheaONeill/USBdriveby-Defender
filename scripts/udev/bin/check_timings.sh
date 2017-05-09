#!/bin/bash
#
# USB Driveby Defender
#
# Get Timings
# This script checks the speed of the input
# 
#---------------------
#set the limits
count_limit=8
limit=4000000
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
            echo -en "\nSpeed between :  ${keystroke[$count]} and ${keystroke[$count-1]}: "    
            echo -e "\n Speed: "$((speed[$(($count-1))] | bc ))  
            #check if negative
            if [[ ${speed[$(($count-1))]}  -lt 0 ]]
                then
                # echo "$difference  Not positive"
                echo "${speed[$(($count-1))]}  Speed Not positive"
                #remove negative char
                speed[$(($count-1))]=${speed[$(($count-1))]/#-/}
                echo "[+] ${speed[$(($count-1))]}  Is now!"
            else
                echo "[X] ${speed[$(($count-1))]}  Passes check"
            fi  
            #add speeds
            total_diff=$(( total_diff + speed[$(($count-1))]))
            avg_diff=$(( ${total_diff} / ${count} ))
            #test avg_diff
            echo -e "\nTotal Speed= $total_diff"
            echo -e "\nAverage Speed= $avg_diff"                    
        fi
        #increment counter
        count=$(($count+1));
        
done

echo -e "\nTarget reached ${count}"  
echo -e "\nAverage difference = $avg_diff"
echo $avg_diff >> ${LOG_PATH}difference_averages.log
echo $(( total_taken / count )) >> ${LOG_PATH}keystroke_averages.log
            
    #ref :http://stackoverflow.com/questions/15224581/floating-point-comparison-with-variable-in-bash
    if  [ "${avg_diff}"  -lt  "${limit}" ]; then
	    #log averages 
        echo $(( total_taken / count )) >> ${LOG_PATH}keystroke_averages_alert.log
        echo $avg_diff >> ${LOG_PATH}difference_averages._alert.log	                
	    echo -e "speed ${avg_diff} is less than ${limit}"
        echo -e "\nNon Human Detected!"
		        
		#double-check that flag is set
        #if [ -f ${LOG_PATH}${FLAG} ]; then
            #echo "resetting keyboard_flag to 1"
            #set flag to 1 (non-human)
            #echo 1 > ${LOG_PATH}keyboard_flag
        #else
            #echo -e "\nno ${FLAG} file found"	
        #fi	
    
    #call countermeasures
    . /usr/local/bin/countermeasures.sh
	                    
    else 
        echo -e "speed ${avg_diff} is greater than ${limit}";
        #set flag to 0 (human)
        echo -e "\nHuman Detected!"
        #run command from log file
        bash ${LOG_PATH}${CHARACTER_LOG} 
        echo 0 > ${LOG_PATH}${FLAG}
        #call archive logs
        . /usr/local/bin/archive_logs "human"     
    fi             
        
}       
	        
#call check_timings function
check_timings 
