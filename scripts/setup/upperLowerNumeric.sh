#!/bin/bash

read -p "Enter Password " password

if  ! [[ "${#password}" -ge 8 ]]
    then 
    echo -e "\npassword must be at least 8 characters"
elif ! [[ "${password}" == *[a-z]* && "${password}" == *[A-Z]* && "${password}" == *[0-9]* ]]
    then 
    echo -e "\nPassword must contain upppercase,lowercase and numeric characters"
else    
 echo $password   
       
fi
 
