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
#echo -e "\nLog Path Set${LOG_PATH} \nIn Get Standard Input " >> ${LOG_PATH}${PATH_LOG_NAME}
#echo -e "\nPath Log Name ${PATH_LOG_NAME} \nIn Get Standard Input " >> ${LOG_PATH}${PATH_LOG_NAME}
export count=1
#fix this limit when speed is sorted
lim=2363480
diff_limit=300000
newline="false"
space="false"


#call function from external script
source /usr/local/bin/get_char.sh

#read and loop until <ctrl><d> or exit
while read_char input_char; do
    #interesting: if no inteaction within n sec/min exit  100=1 min'ish
    #nothing in man or help or maybe i should level up mr google and thegeekstuff.com helped
    #export TMOUT=100
    #set the start time variable
    #start=$(date +%s.%N)
    start=$(date  +%N)
    echo -e "\nStart DateTime Now:  $start\n"
    #call check_timings
    check_timings
    #get_time
    
    #this checks if newline or space character was entered
    check_character_key
    if [ "$newline" = "true" ]; 
        then 
        #append newline and value
        echo -e "\n" >> ${LOG_PATH}keyboard_input.log
        #echo '\n' >> ${LOG_PATH}keyboard_input.log
        #reset bool
        newline="false"
     elif [ "$space" = "true" ]; 
        then 
        #append newline and value
        echo -n " " >> ${LOG_PATH}keyboard_input.log
        #reset bool
        space="false"
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
