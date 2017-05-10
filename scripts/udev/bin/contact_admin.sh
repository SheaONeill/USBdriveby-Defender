#!/bin/bash +x
#
# USB Driveby Defender
#
# Get Standard Input
# This script contacts admin through smpt
# 
# 
#---------------------

#contact_admin
contact_admin(){
  #contact_admin
  echo -e "\nTo do Contact Admin"
  #todo get email var and jpeg var posiibly change name of images
  echo "Attack Details Go Here and Name" | mail -s "USB Driveby Attack" b00084432@gmail.com -A /var/log/driveby_defender/00000005.jpg
}
ls /var/log/driveby_defender/
#call contact_admin function
contact_admin


