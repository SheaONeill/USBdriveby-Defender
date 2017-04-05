#!/bin/bash
#
# USB Driveby Defender
#
#
#---------------------
GET_SETUP_PATH="$(pwd)"
echo "GET_SETUP_PATH: ${GET_SETUP_PATH}"
PARENTDIR="$(dirname "${GET_SETUP_PATH}")/"
echo "PARENTDIR: ${PARENTDIR}"
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
    echo "Copying ${SETUP_RULES_PATH}* to ${LOCAL_RULES_PATH}}"
    echo "press ENTER to continue"; read a
    cp "${SETUP_RULES_PATH}"* ${LOCAL_RULES_PATH}
    ls -la ${LOCAL_RULES_PATH}
    #reload rules: 
    udevadm control --reload-rules
}

#copy scripts to /usr/local/bin/
copy_scripts () {
    #test
    echo -e "\nCopying ${SETUP_BIN_PATH}*.sh to ${LOCAL_BIN_PATH}"
    echo "press ENTER to continue"; read a
    #copy all bin scripts from setup to local
    cp "${SETUP_BIN_PATH}"*  ${LOCAL_BIN_PATH}
    ls -la ${LOCAL_BIN_PATH}
    #maybe edit this to append text to .bashrc
    cp ${PARENTDIR}.bashrc $HOME
    ls -la $HOME
    chmod +x "${LOCAL_BIN_PATH}"*
    ls -la "${LOCAL_BIN_PATH}"
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

