#!/bin/bash
#
# USB Driveby Defender
#
# Get Standard Input
# This script runs mplayer and takes photos
# 
# 
#---------------------
#take_photo
take_photo() {

    #todo append date-time-stamp as image title
    mplayer tv:// -tv driver=v4l2:device=/dev/video0 -frames 5 -vo jpeg:outdir=${LOG_PATH} 2> /dev/null 

}

#call take_photo
take_photo
