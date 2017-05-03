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
#to make a beep sound alarm
#tput bell
#if not initiated sudo modprobe pcspkr
sound_alarm() {
  #while true;do 
  #tput bel
  #; done;
  while true;do   mplayer /usr/share/golismero/tools/sqlmap/extra/beep/beep.wav; done;

}
sound_alarm

