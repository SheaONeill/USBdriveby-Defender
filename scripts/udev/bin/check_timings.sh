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
lim=2363480
diff_limit=4000000
#initialise counter
count=1

check_timings(){
    #ref: http://stackoverflow.com/questions/385408/get-program-execution-time-in-the-shell
 
 while  [ "${count}" -le "${count_limit}" ]
        do
                #add speeds
                 total_taken=$(( total_taken + keystroke[${count}] ))
                 echo -e "\nAverages: Total: $total_taken Divided by Count: $count = $(( total_taken / count ))" 
                 
                 
                  if [ ${count} -gt 1 ];then 
                        #i think the issue is here
                        #need 
                        speed[$(($count-1))]=$(echo "${keystroke[$count]} - ${keystroke[$count-1]}" | bc )
                        echo -en "\nSpeed between :  ${keystroke[$count]} and ${keystroke[$count-1]}: "
            
                        echo -e "\n Speed: "$((speed[$(($count-1))] | bc ))  
                        #check if negative
                        #if [[ $difference  -lt 0 ]]
                         if [[ ${speed[$(($count-1))]}  -lt 0 ]]
                             then
                            # echo "$difference  Not positive"
                            echo "${speed[$(($count-1))]}  Speed Not positive"
                            #remove negative char
                            # difference=${difference/#-/}
                            speed[$(($count-1))]=${speed[$(($count-1))]/#-/}
                            echo "[+] ${speed[$(($count-1))]}  Is now!"
                        else
                            echo "[X] ${speed[$(($count-1))]}  Passes check"
                         fi  
                        #add speeds
                        # total_diff=$(( total_diff + difference))
                        total_diff=$(( total_diff + speed[$(($count-1))]))
                        #avg_diff=$(( ${total_diff} / ${count} ))
                        avg_diff=$(( ${total_diff} / ${count} ))
                        #export average so main shell can access/see it bitch
                        export avg_diff
                        #test avg_diff
                        echo -e "\nTotal Speed= $total_diff"
                        echo -e "\nAverage Speed= $avg_diff"
                    
                fi
  
    
            
            #increment counter
            count=$(($count+1));
done
        echo -e "\nTarget reached ${count}"  
            #echo -en "\nAverage time taken: " $(( total_taken / count ))
            echo -e "\nAverage difference = $avg_diff"
            echo $avg_diff >> ${LOG_PATH}difference_averages.log
            echo -e "\nDifference_averages.logs saved!"
            echo $(( total_taken / count )) >> ${LOG_PATH}keystroke_averages.log
            echo -e "\nKeystroke_averages.logs saved!"
            #get total from file
            #SUM=0; for i in `cat keystroke_averages.log`; do SUM=$(($SUM + $i)); done; echo $SUM
            #wordcount=$(( wc keystroke_averages.log))
            #AVG=$(( SUM / wordcount))
            #ref :http://stackoverflow.com/questions/15224581/floating-point-comparison-with-variable-in-bash
	        #if (( $(echo "$(( total_taken / count ))  < ${lim}" | bc -l) )); then
	        echo -e "\nIs this the error"
	        if  [ "${avg_diff}"  -lt  "${diff_limit}" ]; then
	            #log averages 
                echo $(( total_taken / count )) >> ${LOG_PATH}keystroke_averages_alert.log
                echo -e "\nKeystroke_averages_alert.log saved!"
                echo $avg_diff >> ${LOG_PATH}difference_averages._alert.log
	            echo -e "\nDifference_averages_alert.log saved!"
	            
	            echo -e "speed ${avg_diff} is less than ${diff_limit}"
            	echo -e "\nNon Human Detected!"
		        
		        #double-check that flag is set
		        if [ -f ${LOG_PATH}keyboard_flag ]; then
			        echo "resetting keyboard_flag to 1"
			        #set flag to 1 (non-human)
			        echo 1 > ${LOG_PATH}keyboard_flag
		        else
		        echo -e "\nno keyboard_flag file found"	
	            fi
	
	            #call countermeasures
	            /usr/local/bin/countermeasures.sh
	            
	        
        else echo -e "speed ${avg_diff} is greater than ${diff_limit}";
            #set flag to 0 (human)
                echo -e "\nHuman Detected!"
                #run command from log file
                bash ${LOG_PATH}keyboard_input.log
                echo 0 > ${LOG_PATH}keyboard_flag
                echo "" > ${LOG_PATH}keyboard_input.log
                exit
              
        fi             
        
 }       
        

           
#ref :http://stackoverflow.com/questions/15224581/floating-point-comparison-with-variable-in-bash

	        
#call check_timings function
check_timings 
