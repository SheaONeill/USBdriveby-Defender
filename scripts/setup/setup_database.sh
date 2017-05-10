#!/bin/bash
#
# USB Driveby Defender
#
# Setup Database
#
#---------------------

#setup database function
setup_database () {
    #setup database call dbsetup script and pass values
    #echo  $host $dbname $name $pass
    . ./dbsetup $host $dbname $name $pass
}

#call setup_database function
setup_database
