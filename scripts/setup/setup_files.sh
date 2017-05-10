#!/bin/bash
#
# USB Driveby Defender
#
# Setup files
#
#---------------------


rules_setup () {
    echo -e "\nPaths To: Local Rules:${LOCAL_RULES_PATH} \nLocal Bin  ${LOCAL_BIN_PATH} \n.bashrc: ${BASHRC_PATH}"
    echo -e "\nPaths From: Rules:${SETUP_RULES_PATH} \nLocal Bin  ${SETUP_BIN_PATH} \n.bashrc: ${PARENTDIR}"
    ls  ${SETUP_RULES_PATH} ;ls ${SETUP_BIN_PATH};ls ${PARENTDIR}
    echo "Copying ${SETUP_RULES_PATH}* to ${LOCAL_RULES_PATH}}"
    cp "${SETUP_RULES_PATH}"* ${LOCAL_RULES_PATH}
    ls -la ${LOCAL_RULES_PATH}
    #reload rules: 
    udevadm control --reload-rules
}

copy_scripts () {
    
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
    #create log directory
    mkdir ${LOG_PATH}
    mkdir ${LOG_PATH}logs
   
}

#call rules_setup
rules_setup
#call copy_scripts
copy_scripts
