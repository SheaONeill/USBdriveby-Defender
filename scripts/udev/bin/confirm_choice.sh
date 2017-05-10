#!/bin/bash
#
# USB Driveby Defender
#
# Confirm input
# 
# 
# 
#---------------------

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

#call confirm_function
confirm
