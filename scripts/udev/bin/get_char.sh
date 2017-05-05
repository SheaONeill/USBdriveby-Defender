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
echo -e "\nLOG_PATH SET ${LOG_PATH} \nIN Read Characters " >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "\nPATH_LOG_NAME ${PATH_LOG_NAME} \nIN Read Characters " >> ${LOG_PATH}${PATH_LOG_NAME}
read_char () {
    stty -icanon -echo 
	#period is appended, or command substitution will swallow a newline
	#ref: https://www.peterbe.com/plog/carriage-return-in-bash
	input_char=$(dd bs=1 count=1 2>/dev/null; echo .)
	## Remove the period 	       
	input_char=${input_char%?} 	
	#call check_time
	#get_time 
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

check_timings(){
    #ref: http://stackoverflow.com/questions/385408/get-program-execution-time-in-the-shell

    #subtract start time from now time and set array value
    keystroke[${count}]=$(echo "$(date +%N) - $start" | bc -l)
    #printf "Execution time: %.6f seconds" ${keystroke[${count}]}
    echo -e "\nKeystroke Array Var ${count}: ${keystroke[${count}]}"
    echo -e "\nnewline $newline"
    #check if character count is at eight words
    if [  ${count} -gt 8 ] && [ "${newline}" == "true" ]
        then 
            echo -e "\nnewline $newline"
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
	
	            #call unbind device
	            echo -e "\nunbind device"
                #/usr/local/bin/unbind_device.sh
                #
                #call take_photo
                echo -e "\ntake_photo"
                #/usr/local/bin/take_photo.sh
                #
                #call contact_admin
                echo -e "\ncontact_admin"
	             /usr/local/bin/contact_admin.sh
	            #                
                #call lock_down
                echo -e "\nlock down"
                # /usr/local/bin/lock_down.sh
                #
                #call sound_alarm
                echo -e "\nsound_alarm"
                #/usr/local/bin/sound_alarm.sh
                #
                #addons
	            #upload captured details to server in case system gets compromised
	            #run a check on all opened ports and shut them down where applicable
	            #check captured commands and compare against known scripts
	            
	            #
	        
        else echo -e "speed ${avg_diff} is greater than ${diff_limit}";
            #set flag to 0 (human)
                echo -e "\nHuman Detected!"
                echo -e "\nnewline $newline"
                #run command from log file
                bash ${LOG_PATH}keyboard_input.log
                echo 0 > ${LOG_PATH}keyboard_flag
                echo "" > ${LOG_PATH}keyboard_input.log
                exit
              
        fi
    fi
    
   if [ ${count} -le 8 ];then 
       #add speeds
        total_taken=$(( total_taken + keystroke[${count}] ))
       #
        echo -e "\nAverages: Total: $total_taken Divided by Count: $count = $(( total_taken / count ))" 
       #
        if [ ${count} -gt 1 ];then 
             #$((${ks[$count-1]}-${ks[$count]}))
             echo -e "\nKeystroke Now: ${keystroke[$count]} Keystroke Before: ${keystroke[$count-1]} " 
           #I am an INT
            #declare -i difference
            #declare -i speed[$(($count-1))]
            #difference=$(echo "${keystroke[$count]} - ${keystroke[$count-1]}" | bc )
            speed[$(($count-1))]=$(echo "${keystroke[$count]} - ${keystroke[$count-1]}" | bc )
             echo -en "\nSpeed between :  ${keystroke[$count]} and ${keystroke[$count-1]}: "
            #
            
           #keystroke[${count}]=$(echo "$(date +%N) - $start" | bc)
           #display difference
           # echo -e "\n Difference: "$(($difference | bc ))  
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
    fi
    
    #increment counter
    count=$(($count+1));
   
}

check_timings2(){
    #ref: http://stackoverflow.com/questions/385408/get-program-execution-time-in-the-shell

    #subtract start time from now time and set array value
    dur[${count}]=$(echo "$(date +%N) - $start" | bc -l)
    #printf "Execution time: %.6f seconds" ${dur[${count}]}
    echo -e "\nDifference Array Var ${count}: ${dur[${count}]}"
   
    #check if character count is at eight words
    if [  ${count} -eq 8 ]
        then 
            echo -e "\nEight reached ${count}"  
            echo -en "\nAverage time taken: " $(( total_taken / count ))
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
	        if (( $(echo "$(( total_taken / count ))  < ${lim}" | bc -l) )); then
	            #log averages 
                echo $(( total_taken / count )) >> ${LOG_PATH}keystroke_averages_alert.log
                echo -e "\nKeystroke_averages_alert.log saved!"
                echo $avg_diff >> ${LOG_PATH}difference_averages._alert.log
	            echo -e "\nDifference_averages_alert.log saved!"
	            
	            echo -e "speed ${dur[${count}]} is less than ${lim}"
            	echo -e "\nNon Human Detected!"
		        
		        #double-check that flag is set
		        if [ -f ${LOG_PATH}keyboard_flag ]; then
			        echo "resetting keyboard_flag to 1"
			        #set flag to 1 (non-human)
			        echo 1 > ${LOG_PATH}keyboard_flag
		        else
		        echo -e "\nno keyboard_flag file found"	
	            fi
	
	            #call unbind device
                #/usr/local/bin/unbind_device.sh
                #
                #call take_photo
               # /usr/local/bin/take_photo.sh
                #
                #contact_admin
	            # /usr/local/bin/contact_admin.sh
	            #                
                #lock_down
                # /usr/local/bin/lock_down.sh
                #
                #call sound_alarm
                #/usr/local/bin/sound_alarm.sh
                #
                #addons
	            #upload captured details to server in case system gets compromised
	            #run a check on all opened ports and shut them down where applicable
	            #check captured commands and compare against known scripts
	            
	            #
	        
        else echo -e "speed ${dur[${count}]} is greater than ${lim}";
            #set flag to 0 (human)
                echo -e "\nHuman Detected!"
                echo 0 > ${LOG_PATH}keyboard_flag
              
        fi
    fi
    
   if [ ${count} -le 8 ];then 
       #add speeds
        total_taken=$(( total_taken + dur[${count}] ))
       #
        echo -e "\nAverages: Total:$total_taken Divided by Count: $count = $(( total_taken / count ))" 
       #
        if [ ${count} -gt 1 ];then 
             #$((${ks[$count-1]}-${ks[$count]}))
             echo -e "\nDuration Now: ${dur[$count]} Duration Before: ${dur[$count-1]} " 
           #I am an INT
            declare -i testdiff
            testdiff=$(echo "${dur[$count]} - ${dur[$count-1]}" | bc )
           #dur[${count}]=$(echo "$(date +%N) - $start" | bc)
           #display difference
            echo -e "\n Difference: "$(($testdiff | bc ))  
            #check if negative
               if [[ $testdiff  -lt 0 ]]
                then
                    echo "$testdiff  Not positive"
                    #remove negative char
                    testdiff=${testdiff/#-/}
                    echo "[+] $testdiff  Is now!"
                else
                    echo "[X] $testdiff  Passes check"
                fi  
             #add speeds
            total_diff=$(( total_diff + testdiff))
            avg_diff=$(( ${total_diff} / ${count} ))
            #export average so main shell can access/see it bitch
            export avg_diff
            #test avg_diff
            echo -e "\nAverage Difference = $avg_diff"
            
        fi
    fi
    
    #increment counter
    count=$(($count+1));
   
}






