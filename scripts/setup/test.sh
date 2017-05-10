#!/bin/bash

#call check_dependencies function
GET_SETUP_PATH="$(pwd)"


#confirm user input
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

#todo reset database
confirm "" ". ./get_user_info.sh" "Get User Info?"

read -p "enter password to test" password

. .././check_password.sh $password

