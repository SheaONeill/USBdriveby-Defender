#!/bin/bash 
#
#Application:   USB Driveby Defender
#Authors:       Shea O'Neill, Paddy Cronan
#Date:          20/03/17
#Version:       1.0
#Title:         check_dependencies.sh
#Description:   This script checks application dependencies
#---------------------------------------------------------------------------------

check_dependencies () {

    gnome-terminal -e 'bash -c "sudo apt-get update"' & wait $!
    #ref: http://stackoverflow.com/a/592649
    
    for dependency in bc fswebcam mailutils ssmtp
        
        do   
        if which ${dependency} >/dev/null; then 
            echo "${dependency} is already installed............." 
        else 
            echo -e "\nInstalling ${dependency}\n" 
            gnome-terminal -e 'bash -c "sudo apt-get install '"${dependency}"'"' & wait $!
        fi
        done  
}

#call check_dependencies function
check_dependencies
