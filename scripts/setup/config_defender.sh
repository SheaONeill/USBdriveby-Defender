#!/bin/bash 
#
#Application:   USB Driveby Defender
#Authors:         Shea O'Neill, Paddy Cronan
#Date:              20/03/17
#Version:         1.0
#Title:               config_defender.sh
#Description:   This script cofigures ssmpt config file
#-------------------------------------------------------------------------

config_defender () {
        
    #this is hardcoded for testing and demo
    SSMPT_PATH=$(find /etc/ -name ssmtp.conf)
    #this is hardcoded for testing and demo
    mail_server="smtp.gmail.com:587"
  #remove comment in ssmtp.conf  config file
    sed -i 's/#FromLineOverride\=YES/FromLineOverride\=YES/' ${ssmtp_config}
    #append details
    echo -e "\n#Added by Driveby-Defender\nAuthUser=${admin_email}\nAuthPass=${admin_pass_1}\nmailhub=${mail_server}\nUseSTARTTLS=YES" >>${ssmtp_config}
    #for mplayer errors
    echo "lirc=no" >> ${HOME}/.mplayer/config
    
}
#call config_ssmtp function
config_defender

