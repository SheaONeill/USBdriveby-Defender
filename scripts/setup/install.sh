#!/bin/bash 
#
#Application:   USB Driveby Defender
#Authors:       Shea O'Neill, Paddy Cronan
#Date:          20/03/17
#Version:       1.0
#Title:         install.sh
#Description:   This script sets up the application
#-------------------------------------------------------------------------------------

GET_SETUP_PATH="$(pwd)"
PARENTDIR="$(dirname "${GET_SETUP_PATH}")/"
LOCAL_BIN_PATH="/usr/local/bin/"
LOCAL_RULES_PATH="/etc/udev/rules.d/"
BASHRC_PATH="$HOME/.bashrc"
SSMPT="$HOME.ssmp"
UID="$HOME.user_id"
SETUP_RULES_PATH="${PARENTDIR}/udev/rules/"
SETUP_BIN_PATH="${PARENTDIR}/udev/bin/"
LOG_PATH="/var/log/driveby_defender/"
SSMPT_PATH=$(find /etc/ -name ssmtp.conf)

confirm() {
  while true; do
    echo -e "\n$3\n"
    read -r -n 1 -p "${1:-Continue?} [y/n]: " REPLY
    case $REPLY in
      [yY]) echo -e "\n"; $2  ; return 0 ;;
      [nN]) echo ; return 1 ;;
      *) printf " \033[31m %s \n\033[0m" "invalid input"
    esac 
  done  
}

main () {
    
    #check_dependencies
    confirm "" ". ./check_dependencies.sh" "Check Dependencies?"
    #setup files
    confirm "" ". ./setup_files.sh" "Setup Files?"   
    #get_db_details
    confirm "" ". ./get_db_details.sh" "Get Database Details?"
    #setup_database
    confirm "" ". ./setup_database.sh" "Setup Database?"
    #get user info
    confirm "" ". ./get_user_info.sh" "Get User Info?"
    #
    
          
}

main "$@"

