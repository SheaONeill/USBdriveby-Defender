#!/bin/bash 
#
#Application:   USB Driveby Defender
#Authors:       Shea O'Neill, Paddy Cronan
#Date:          20/03/17
#Version:       1.0
#Title:         sound_alarm.sh
#Description:   This script plays alarm sound
#---------------------------------------------------------------------------------------

source /usr/local/bin/authenticate_human.sh
#trap key
trap "authenticate_human" SIGINT SIGKILL SIGTERM SIGHUP

sound_alarm() {
   
    #loop beep wave source ref: /usr/share/golismero/tools/sqlmap/extra/beep/beep.wav
    while  [ "${authenticate}" != "true" ];
        do 
        paplay /usr/local/bin/beep.wav &> /dev/null
        sleep 0.2
    done 
    
}
#call sound_alarm function
sound_alarm

