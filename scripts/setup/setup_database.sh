#!/bin/bash 
#
#Application:   USB Driveby Defender
#Authors:         Shea O'Neill, Paddy Cronan
#Date:              20/03/17
#Version:         1.0
#Title:               setup_database.sh
#Description:   This script call the database script
#--------------------------------------------------------------------

#setup database function
setup_database () {
    #setup database call dbsetup script and pass values
    . ./dbsetup $host $dbname $name $pass
}

#call setup_database function
setup_database
