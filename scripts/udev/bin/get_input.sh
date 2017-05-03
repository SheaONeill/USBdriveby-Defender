#!/bin/bash
#
# USB Driveby Defender
#
# Get Standard Input
# This script calls a function in get_char script
# and checks the speed of stdin and logs everything
# Work in Progress!!
#---------------------

#check the path variables
echo -e "\nLog Path Set${LOG_PATH} \nIn Get Standard Input " >> ${LOG_PATH}${PATH_LOG_NAME}
echo -e "\nPath Log Name ${PATH_LOG_NAME} \nIn Get Standard Input " >> ${LOG_PATH}${PATH_LOG_NAME}
export count=1
#fix this limit when speed is sorted
lim=2363480
diff_limit=250000
check_timings(){
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
                /usr/local/bin/unbind_device.sh
                #
                #call take_photo
                /usr/local/bin/take_photo.sh
                #
                #contact_admin
	             /usr/local/bin/contact_admin.sh
	            #                
                #lock_down
                 /usr/local/bin/lock_down.sh
                #
                #call sound_alarm
                /usr/local/bin/sound_alarm.sh
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

#call function from external script
source /usr/local/bin/get_char.sh

#read and loop until <ctrl><d> or exit
while read_char input_char; do
    #interesting: if no inteaction within n sec/min exit  100=1 min'ish
    #nothing in man or help or maybe i should level up mr google and thegeekstuff.com helped
    export TMOUT=100
    #set the start time variable
    #start=$(date +%s.%N)
    start=$(date  +%N)
    echo -e "\nStart DateTime Now:  $start\n"
    #call check_timings
    check_timings
    
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

#pipe standard input into loop	
done #< /dev/stdin <-not necessary using dd
