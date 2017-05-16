#!/bin/bash 
#
#Application:   USB Driveby Defender
#Authors:         Shea O'Neill, Paddy Cronan
#Date:              20/03/17
#Version:         1.0
#Title:               enact_countermeasures.sh
#Description:   This script calls enacts countermeasures during attack 
#-------------------------------------------------------------------------------------------------
enact_countermeasures() {
 
    #call unbind device
    . /usr/local/bin/unbind_device.sh 2>&1 >/dev/null
    #call take_photo
    . /usr/local/bin/take_photo.sh 2>&1 >/dev/null
    #add to blacklist
    . /usr/local/bin/update_database.sh "add_attack" "${LOG_PATH}" "device_id.log" 2>&1 >/dev/null
    #contact_admin
	.  /usr/local/bin/contact_admin.sh
	#call archive logs
    . /usr/local/bin/archive_logs.sh "non-human"  2>&1 >/dev/null
	#call lock_down
    . /usr/local/bin/lock_down.sh 2>&1 >/dev/null
    #call sound_alarm
    . /usr/local/bin/sound_alarm.sh 2>&1 >/dev/null
   	
}

#call enact_countermeasures function
enact_countermeasures                      
