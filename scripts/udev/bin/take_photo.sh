#!/bin/bash 
#
#Application:   USB Driveby Defender
#Authors:         Shea O'Neill, Paddy Cronan
#Date:              20/03/17
#Version:         1.0
#Title:               take_photo.sh
#Description:   This script runs mplayer and takes photos
#-------------------------------------------------------------------------------

take_photo() {

    #todo append date-time-stamp as image title
    mplayer tv:// -tv driver=v4l2:device=/dev/video0 -frames 5 -vo jpeg:outdir=${LOG_PATH} 
    #clear
}

#call take_photo
take_photo
