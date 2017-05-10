#!/bin/bash
#
# USB Driveby Defender
#
# Get Standard Input
# This script runs mplayer and plays alarm sound
# 
# 
#---------------------

config_defender () {

    #do i need this here
    GET_SETUP_PATH="$(pwd)"
    echo "GET_SETUP_PATH: ${GET_SETUP_PATH}"
    PARENTDIR="$(dirname "${GET_SETUP_PATH}")/"
    echo "PARENTDIR: ${PARENTDIR}"
    
    #this is for testing and is set in install script
    SSMPT_PATH=$(find /etc/ -name ssmtp.conf)
    
}

config_ssmtp () {
    
    ssmtp_config=$(find /etc/ -name ssmtp.conf)
    #remove comment in ssmtp.conf  config file
    sed -i 's/#FromLineOverride\=YES/FromLineOverride\=YES/' ${ssmtp_config}
    #append details
    #to do mailhub as var
    echo -e "\n#Added by Driveby-Defender\nAuthUser=paddyotg@gmail.com\nAuthPass=${admin_pass_1}\nmailhub=smtp.gmail.com:587\nUseSTARTTLS=YES" >>${ssmtp_config}
   
}

#confirm user input
confirm() {
  while true; do
    read -r -n 1 -p "${1:-Continue?} [y/n]: " REPLY
    case $REPLY in
      [yY]) echo ; return 0 ;;
      [nN]) config_defender ; return 1 ;;
      *) printf " \033[31m %s \n\033[0m" "invalid input"
    esac 
  done  
}
#call config_ssmtp function
config_defender
#call config_ssmtp function
config_ssmtp
