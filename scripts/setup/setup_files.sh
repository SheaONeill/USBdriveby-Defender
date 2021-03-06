#!/bin/bash 
#
#Application:   USB Driveby Defender
#Authors:         Shea O'Neill, Paddy Cronan
#Date:              20/03/17
#Version:         1.0
#Title:               setup_files.sh
#Description:   This script sets up paths, files and folders 
#-------------------------------------------------------------------------------



rules_setup () {
    echo -e "\nPaths To: Local Rules:${LOCAL_RULES_PATH} \nLocal Bin  ${LOCAL_BIN_PATH} \n.bashrc: ${BASHRC_PATH}"
    echo -e "\nPaths From: Rules:${SETUP_RULES_PATH} \nLocal Bin  ${SETUP_BIN_PATH} \n.bashrc: ${PARENTDIR}"
    echo "Copying ${SETUP_RULES_PATH}* to ${LOCAL_RULES_PATH}}"
    cp "${SETUP_RULES_PATH}"* ${LOCAL_RULES_PATH}
    #reload rules: 
    udevadm control --reload-rules
}

copy_scripts () {
    
    echo -e "\nCopying ${SETUP_BIN_PATH}*.sh to ${LOCAL_BIN_PATH}"
    echo "press ENTER to continue"; read a
    #copy all bin scripts from setup to local
    cp "${SETUP_BIN_PATH}"*  ${LOCAL_BIN_PATH}
    ls -la ${LOCAL_BIN_PATH}
    #append file contentents to .bashrc
    echo ${PARENTDIR}.bashrc_driveby >> $HOME/.bashrc 
    chmod +x "${LOCAL_BIN_PATH}"*
    ls -la "${LOCAL_BIN_PATH}"
    #create log directory
    mkdir ${LOG_PATH}
    mkdir ${LOG_PATH}logs
   
}

#call rules_setup
rules_setup
#call copy_scripts
copy_scripts
