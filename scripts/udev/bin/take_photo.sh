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
#todo use variable log path 
#try and append date-time-stamp as image title
mplayer tv:// -tv driver=v4l2:device=/dev/video0 -frames 5 -vo jpeg:outdir=/var/log/driveby_defender/

}

#call take_photo
take_photo
