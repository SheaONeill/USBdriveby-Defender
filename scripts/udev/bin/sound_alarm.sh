#!/bin/bash 
#
#Application:   USB Driveby Defender
#Authors:         Shea O'Neill, Paddy Cronan
#Date:              20/03/17
#Version:         1.0
#Title:               sound_alarm.sh
#Description:   This script runs mplayer and plays alarm sound
#---------------------------------------------------------------------------------------
#trap source
source /usr/local/bin/authenticate_human.sh
#trap key
trap "authenticate_human" SIGINT SIGTERM SIGHUP
sound_alarm() {
    
    #loop beep wave source ref: /usr/share/golismero/tools/sqlmap/extra/beep/beep.wav
    while true
        do 
        if [ "$authenticate" == "true" ]
        then 
            echo -e "\nExiting Get Input in 5 seconds"
            sleep 5
             	read -p "sound_alarm press enter to exit " answer
exit
        fi
        mplayer /usr/local/bin/beep.wav
        done 
    #clear
}
#call sound_alarm function
sound_alarm

