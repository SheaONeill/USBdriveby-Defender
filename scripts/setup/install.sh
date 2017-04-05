#!/bin/bash
#
# USB Driveby Defender
#
#
#---------------------
GET_SETUP_PATH="$(dirname "$0")"
echo $GET_SETUP_PATH
PARENTDIR="$(dirname "${GET_SETUP_PATH}")"
echo $PARENTDIR
read a
LOCAL_BIN_PATH="/usr/local/bin/"
LOCAL_RULES_PATH="/etc/udev/rules.d/"
BASHRC_PATH="$HOME/.bashrc"
SETUP_RULES_PATH="${PARENTDIR}/udev/rules/"
SETUP_BIN_PATH="${PARENTDIR}/udev/bin/"
echo $SETUP_RULES_PATH


#copy rules to udev directory
rules_setup () {
    echo -e "\nPaths To: Local Rules:${LOCAL_RULES_PATH} \nLocal Bin  ${LOCAL_BIN_PATH} \n.bashrc: ${BASHRC_PATH}"
    echo -e "\nPaths From: Rules:${SETUP_RULES_PATH} \nLocal Bin  ${SETUP_BIN_PATH} \n.bashrc: ${PARENTDIR}"
    ls  ${SETUP_RULES_PATH} ;ls ${SETUP_BIN_PATH};ls ${PARENTDIR}
    echo "Copying ${SETUP_RULES_PATH}*.rules to ${GIT_REPO_PATH}${GIT_REPO_RULES_PATH}"
    echo "press ENTER to continue"; read a
    cp {63-usb-kbd.rules,81-usb-flash.rules} ${GIT_REPO_RULES_PATH}
    ls -la ${GIT_REPO_RULES_PATH}
    #reload rules: 
    udevadm control --reload-rules
}

#copy scripts to /usr/local/bin/
copy_scripts () {
    #need to change this to $0 
    cp {usb_flash_udev.sh,usb_keyboard_udev.sh,usb_flash_.sh,usb_flash_remove.sh,usb_keyboard_remove.sh} /usr/local/bin/
    cp {get_input.sh,get_char.sh} /usr/local/bin/
    cp {.bascrc} $HOME
    chmod +x /usr/local/bin/*
    ls -la /usr/local/bin/
}

#setup database function
setup_database () {
    #setup database call dbsetup script and pass values
    ./dbsetup $host $dbname $name $pass
}

#get user input
get_db_details () {
    echo -n "database host: "
    read host
    #if $host="q" then exit 
    echo -en "database name: "
    read dbname
    echo -en "username: "
    read name
    echo -en "password: "
    read pass    
}
 main () {
     #call rules_setup function
     rules_setup
     #call copy_scripts function
     copy_scripts
     #call get_db_details function
     get_db_details
     #call setup_database function
     setup_database   
}

main "$@"

