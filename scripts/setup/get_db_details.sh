#!/bin/bash 
#
#Application:   USB Driveby Defender
#Authors:         Shea O'Neill, Paddy Cronan
#Date:              20/03/17
#Version:         1.0
#Title:               get_db_details.sh
#Description:   This script reads user db details
#------------------------------------------------------------------


get_db_details () {

    read -p "database host: " host
    read -p  "database name: " dbname
    read -p "database username: " name
    read -p "database password: " pass    
 
}

#call get_db_details function
get_db_details
