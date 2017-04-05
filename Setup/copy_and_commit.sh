#!/bin/bash
#
# USB Driveby Defender
#
#
#---------------------

#copy rules to git repo
LOCAL_BIN_PATH="/usr/local/bin/"
LOCAL_RULES_PATH="/etc/udev/rules.d/"
GIT_REPO_PATH="/media/root/DATA/Dropbox/Year_3/Semester_2/Project/Github_Local-Repo/"
GIT_REPO_RULES_PATH="Scripts/Udev/Rules/ "
GIT_REPO_BIN_PATH="Scripts/Udev/bin/ "
BASHRC_PATH="$HOME/.bashrc"
#test
echo -e "\nPaths: Local :${LOCAL_RULES_PATH} \nGit  ${GIT_REPO_PATH} \nGit Rules: ${GIT_REPO_RULES_PATH}"
echo "Copying ${LOCAL_RULES_PATH}*.rules to ${GIT_REPO_PATH}${GIT_REPO_RULES_PATH}"
echo "press ENTER to continue"; read a
#copy all rules from local to git
cp "${LOCAL_RULES_PATH}"*.rules ${GIT_REPO_PATH}${GIT_REPO_RULES_PATH}
echo
ls ${GIT_REPO_PATH}${GIT_REPO_RULES_PATH}
#
#test
echo -e "\nCopying ${LOCAL_BIN_PATH}*.sh to ${GIT_REPO_PATH}${GIT_REPO_BIN_PATH}"
echo "press ENTER to continue"; read a
#copy all scripts from local to git
cp "${LOCAL_BIN_PATH}"*.sh ${GIT_REPO_PATH}${GIT_REPO_BIN_PATH}
echo
ls ${GIT_REPO_PATH}${GIT_REPO_BIN_PATH}
#
#test
echo -e "\nCopying ${LOCAL_BIN_PATH}Setup/  to ${GIT_REPO_PATH}"
echo "press ENTER to continue"; read a
#copy setup scripts from local to git
cp  -r "${LOCAL_BIN_PATH}Setup/" ${GIT_REPO_PATH}
echo
ls ${GIT_REPO_PATH}Setup/
#
#test
echo -e "\nCopying ${BASHRC_PATH}  to ${GIT_REPO_PATH}"
echo "press ENTER to continue"; read a
#copy scripts from local to git
cp "${BASHRC_PATH}" ${GIT_REPO_PATH}
echo
ls -a ${GIT_REPO_PATH}
#
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


