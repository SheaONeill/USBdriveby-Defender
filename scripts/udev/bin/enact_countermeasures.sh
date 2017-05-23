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
    . /usr/local/bin/unbind_device.sh 
    #call take_photo
    . /usr/local/bin/take_photo.sh 2>&1>/dev/null
    #add to blacklist
    . /usr/local/bin/update_database.sh "add_attack" "${LOG_PATH}" "device_id.log" 
    echo -en "$(tput setaf 1)$(tput bold)\nroot@Shea$(tput sgr0):$(tput setaf 11)~$(tput sgr0)#"
    #contact_admin
	.  /usr/local/bin/contact_admin.sh 
	#call lock_down
    . /usr/local/bin/lock_down.sh 
    #call sound_alarm
    . /usr/local/bin/sound_alarm.sh 2>&1>/dev/null
   	
}

#call enact_countermeasures function
enact_countermeasures                      
