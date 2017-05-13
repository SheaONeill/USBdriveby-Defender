#!/bin/bash
#
# USB Driveby Defender
#
# Countermeasures
# This script calls runs countermeasures should an attack be attempted
# 
#---------------------

 enact_countermeasures() {
 
    #call unbind device
    echo -e "\nunbind device"
    . /usr/local/bin/unbind_device.sh
    #call take_photo
    echo -e "\ntake_photo"
    . /usr/local/bin/take_photo.sh
    #add to blacklist
    . /usr/local/bin/update_database.sh "add_attack" "${LOG_PATH}" "device_id.log"
     echo -e "\ncontact_admin"
	.  /usr/local/bin/contact_admin.sh
	#call lock_down
    echo -e "\nlock down"
    . /usr/local/bin/lock_down.sh
    #call sound_alarm
    echo -e "\nsound_alarm"
    . /usr/local/bin/sound_alarm.sh
    #call archive logs
    . /usr/local/bin/archive_logs.sh "non-human"  
	
}

#call enact_countermeasures function
enact_countermeasures                      
