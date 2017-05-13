#!/bin/bash
#
# USB Driveby Defender
#
# Get Standard Input
# This cofigures ssmpt config file
# 
#---------------------

config_defender () {
        
    #this is for testing and is set in install script
    SSMPT_PATH=$(find /etc/ -name ssmtp.conf)
    
}

config_ssmtp () {
    
    #this is hardcoded temp
    mail_server="smtp.gmail.com:587"
    ssmtp_config=$(find /etc/ -name ssmtp.conf)
    #remove comment in ssmtp.conf  config file
    sed -i 's/#FromLineOverride\=YES/FromLineOverride\=YES/' ${ssmtp_config}
    #append details
    echo -e "\n#Added by Driveby-Defender\nAuthUser=${admin_email}\nAuthPass=${admin_pass_1}\nmailhub=${mail_server}\nUseSTARTTLS=YES" >>${ssmtp_config}

}

#call config_ssmtp function
config_defender
#call config_ssmtp function
config_ssmtp
