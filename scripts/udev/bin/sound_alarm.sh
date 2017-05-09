#!/bin/bash
#
# USB Driveby Defender
#
# Get Standard Input
# This script runs mplayer and plays alarm sound
# 
# 
#---------------------

#sound the alarm
sound_alarm() {
    #todo check if speaker is muted
    #loop beep wave
    while true;do   mplayer /usr/local/bin/beep.wav; done; 2> /dev/null 

}
#call sound_alarm function
sound_alarm

