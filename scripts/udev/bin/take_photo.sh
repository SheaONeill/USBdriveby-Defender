#!/bin/bash 
#
#Application:   USB Driveby Defender
#Authors:       Shea O'Neill, Paddy Cronan
#Date:          20/03/17
#Version:       1.0
#Title:         take_photo.sh
#Description:   This script take photo from webcam
#-------------------------------------------------------------------------------

take_photo() {

    #take photo from webcam
    fswebcam -i 0 -d v4l2:/dev/video0  --no-banner -r 640x480 --jpeg 85 -D 1 ${LOG_PATH}attacker.jpg &> /dev/null
    
}

#call take_photo
take_photo
