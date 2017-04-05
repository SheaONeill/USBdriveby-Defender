#!/bin/bash

#copy rules to udev directory
rules_setup () {
    cp {63-usb-kbd.rules,81-usb-flash.rules} /etc/udev/rules.d/
    ls -la /etc/udev/rules.d/
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

