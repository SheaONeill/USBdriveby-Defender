#!/bin/bash
#
# USB Driveby Defender
#
# Check Dependencies
#
#---------------------

check_dependencies () {

    echo -e "\nUpdating\n" 
    gnome-terminal -e 'bash -c "sudo apt-get update"' & wait $!
    #ref: http://stackoverflow.com/a/592649
    
    for dependency in bc mplayer mailutils ssmtp
        
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
