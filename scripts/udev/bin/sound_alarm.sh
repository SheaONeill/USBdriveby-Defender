#!/bin/bash 
#
#Application:   USB Driveby Defender
#Authors:         Shea O'Neill, Paddy Cronan
#Date:              20/03/17
#Version:         1.0
#Title:               sound_alarm.sh
#Description:   This script runs mplayer and plays alarm sound
#---------------------------------------------------------------------------------------

sound_alarm() {
    
    #loop beep wave source ref: /usr/share/golismero/tools/sqlmap/extra/beep/beep.wav
    while true;do   mplayer /usr/local/bin/beep.wav; done 2>&1 >/dev/null

}
#call sound_alarm function
sound_alarm

