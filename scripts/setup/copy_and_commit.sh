#!/bin/bash 
#
#Application:   USB Driveby Defender
#Authors:         Shea O'Neill, Paddy Cronan
#Date:              20/03/17
#Version:         1.0
#Title:               copy_and_commit.sh
#Description:   This script copys files to git repo
#-------------------------------------------------------------------------


git_bash () {
    #copy rules to git repo
    LOCAL_BIN_PATH="/usr/local/bin/"
    LOCAL_RULES_PATH="/etc/udev/rules.d/"
    GIT_REPO_PATH="/media/root/DATA/Dropbox/Year_3/Semester_2/Project/Github_Local-Repo/"
    GIT_REPO_RULES_PATH="scripts/udev/rules/ "
    GIT_REPO_BIN_PATH="scripts/udev/bin/ "
    GIT_REPO_SETUP_PATH="scripts/"
    BASHRC_PATH="$HOME/.bashrc"
    #test
    echo -e "\nPaths: Local :${LOCAL_RULES_PATH} \nGit  ${GIT_REPO_PATH} \nGit Rules: ${GIT_REPO_RULES_PATH}"
    echo "Copying ${LOCAL_RULES_PATH}*.rules to ${GIT_REPO_PATH}${GIT_REPO_RULES_PATH}"
    echo "press ENTER to continue"; read a
    #copy all rules from local to git
    cp "${LOCAL_RULES_PATH}"63-usb-kbd.rules ${GIT_REPO_PATH}${GIT_REPO_RULES_PATH}
    cp "${LOCAL_RULES_PATH}"81-usb-flash.rules ${GIT_REPO_PATH}${GIT_REPO_RULES_PATH}
    echo
    ls ${GIT_REPO_PATH}${GIT_REPO_RULES_PATH}
    #
    #test
    echo -e "\nCopying ${LOCAL_BIN_PATH}*.sh to ${GIT_REPO_PATH}${GIT_REPO_BIN_PATH}"
    echo "press ENTER to continue"; read a
    #copy all scripts from local to git
    cp "${LOCAL_BIN_PATH}"*.sh ${GIT_REPO_PATH}${GIT_REPO_BIN_PATH}
    cp "${LOCAL_BIN_PATH}"*.wav ${GIT_REPO_PATH}${GIT_REPO_BIN_PATH}
    echo
    ls ${GIT_REPO_PATH}${GIT_REPO_BIN_PATH}
    #
    #test
    echo -e "\nCopying ${LOCAL_BIN_PATH}setup/  to ${GIT_REPO_PATH}${GIT_REPO_SETUP_PATH}"
    echo "press ENTER to continue"; read a
    #copy setup scripts from local to git
    cp  -r "${LOCAL_BIN_PATH}setup/" ${GIT_REPO_PATH}${GIT_REPO_SETUP_PATH}
    echo
    ls ${GIT_REPO_PATH}${GIT_REPO_SETUP_PATH}setup/
    #
    #test
    echo -e "\nCopying ${BASHRC_PATH}  to ${GIT_REPO_PATH}${GIT_REPO_SETUP_PATH}"
    echo "press ENTER to continue"; read a
    #copy scripts from local to git
    cp "${BASHRC_PATH}" ${GIT_REPO_PATH}${GIT_REPO_SETUP_PATH}
    echo
    ls -a ${GIT_REPO_PATH}${GIT_REPO_SETUP_PATH}
    #git pull origin master
    echo  -e "\nChanging Directory"
    cd ${GIT_REPO_PATH}
    echo -e "\nChecking status...."; git status
    echo -e "\nPulling remote files now!"; git pull origin master
    echo -e "\nCommiting files locally now!"; git add -A
    echo -e "\nChecking status...."; git status
    echo -e "\nEnter Commit Message now!"; read commit_message
    echo -e "\nCommit Message : ${commit_message}"; git commit -m "${commit_message}"
    echo -e "\nChecking status...."; git status
    echo -e "\nPushing files to remote now!"; git push origin master
}
#call git_bash function
git_bash
