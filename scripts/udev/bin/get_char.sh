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
    check_enter_key 
	stty icanon echo
    }

#this function checks and sets if newline
check_enter_key () {
    if [ "$input_char" = $'\n' ]; 
        then newline=true
    fi
	}

authenticate_human() {
echo -e "\n\nCtrl C Detected!\nDo the password stuff here"
#use hash as this is a security course after all.
trap "" 2 
stty icanon echo
exit 2
}	

#get_time
get_time() {
#set current time to var array strip floating point
#ks[$count]=$(echo "$(date +%s.%N)" | bc -l)
ks[$count]=$(bc <<< "$(date +%N)")
echo -e "\nNanoseconds Now: ${ks[$count]}"
echo -e "\nCount Now: ${count}"
#check if second keypress then calculate
if [ $count -gt 1 ]; then
    #speed[$(($count-1))]=$(echo "$((ks[$((count))]))" - "$((ks[$((count-1))]))" | bc)
    #subtract second keystrokefrom first and set to result array
    #speed[$(($count-1))]=$(bc <<< "${ks[$count]}-${ks[$count-1]}")
    echo -e "\nTest 01: $((${ks[$count-1]}-${ks[$count]}))"
    testdiff=$((${ks[$count-1]}-${ks[$count]}))
    echo -e "\n testdiff: $testdiff"
    break
    
    speed[$(($count-1))]=$((${ks[$count-1]}-${ks[$count]}))
    echo -e "\nSpeed:  speed[$(($count-1))]"
    #check if more than three keypresses then calculate (these values can be altered obviously
    if [ $count -gt 2 ] && [ $count -lt 5 ]; then 
        #add speed differences 
        #
        #getting standard input error here why???????????????????????
        #
   echo -e "\n\n*******************************************"
        #don't need all the echo shit remove when all good
   echo -e "\nSpeed: ${speed[$(($count-1))]}"
        #
        #total=$(bc <<< "${speed[$count-1]}+${speed[$count]}")
        echo -e "\nTest 02: $((${speed[$count-1]}+${speed[$count]}))"
        total="$((${speed[$count-1]}+${speed[$count]}))"
        echo -e "\nTotal : $total"
        
        if [ $count -eq 4 ]; then
            
            echo -e "\ncount @=$count"
            #avg=$(bc <<<"${total} / ${count}")
            avg=$(( ${total} / ${count} ))
            #export average so main shell can access/see it bitch
            export avg
            #test avg
            echo -e "Average speed = $avg"
        fi
        echo -e "*******************************************\n\n"
    fi
    #don't need all the echo shit remove when all good
   # echo -e "\nSpeed: ${speed[$(($count-1))]}"
fi
echo -e "\n\n========================"
echo -e "\nCount=$count"
echo -e "\nKeystroke_01=: ${ks[$count]}"
echo -e "\nKeystroke_02=: ${ks[$count-1]}"
count=$(($count+1));
#echo -e "\nCount Now: $count"
echo -e "========================\n\n"
}






