#!/bin/bash
#
# USB Driveby Defender
#
# Get Database Details
#
#---------------------

get_db_details () {

    read -p "database host: " host
    read -p  "database name: " dbname
    read -p "database username: " name
    read -p "database password: " pass    
 
}

#call get_db_details function
get_db_details
