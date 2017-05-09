#!/bin/bash
#
# USB Driveby Defender
#
# Countermeasures
# This script calls runs countermeasures should an attack be attempted
# 
#---------------------


 unbind_device() {
 
    #call unbind device
    echo -e "\nunbind device"
    . /usr/local/bin/unbind_device.sh
    #call take_photo
    echo -e "\ntake_photo"
    . /usr/local/bin/take_photo.sh
    #add to blacklist
    . /usr/local/bin/update_database.sh "add_attack" "${LOG_PATH}" "device_id.log"
     #call archive logs
     . /usr/local/bin/archive_logs "non-human"    
    
    #call contact_admin
    
    #get admin email address and user email/username from database using user id in hidden file
    #get password from encrypted file
    #plug stored app password into the ssmpt script cong file
    #run email command to user & cc admin  #need username user email & admin email
      
    
    echo -e "\ncontact_admin"
	.  /usr/local/bin/contact_admin.sh
	#call lock_down
     echo -e "\nlock down"
     #. /usr/local/bin/lock_down.sh
     #call sound_alarm
     echo -e "\nsound_alarm"
     #. /usr/local/bin/sound_alarm.sh
     #
     #addons
	 #upload captured details to server in case system gets compromised
	 #run a check on all opened ports and shut them down where applicable
	 #check captured commands and compare against known scripts	
	 
	
}

#call unbind device function
unbind_device	                      
