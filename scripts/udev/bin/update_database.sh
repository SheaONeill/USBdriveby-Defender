#!/bin/bash
#
# USB Driveby Defender
#
# Blacklist Device
# This script updates database,
# 
# 
#---------------------

update_database () {
    
    #check if mysql is running
    RUNNING=$(pgrep mysql | wc -l)
    if [ "$RUNNING" -eq 0 ]
        then
            echo -e "\nMySQL is not running"
            service mysql start
    else
        echo -e "\nMySQL is running"
    fi
    
    #testing database get these vars from file
    host="localhost"
    name="driveby"
    pass="defender"
    dbname="defender"
    device_id="device_id"
    vendor_id="vendor_id"
    product_id="product_id"

    if [ "$1" == "check_database" ]; then
        query_id="SELECT ${vendor_id},${product_id} FROM blacklist WHERE ${vendor_id}='$(<$2${VENDOR_ID})' AND ${product_id}='$(<$2${PRODUCT_ID})';"
        mysql -N -h $host -u $name -p$pass $dbname <<<$query_id >$2$3

    elif [ "$1" == "remove" ];then
        query="DELETE FROM blacklist WHERE ${vendor_id}='$(<$2${VENDOR_ID})' AND ${product_id}='$(<$2${PRODUCT_ID})';"
            
    elif [ "$1" == "add_user" ];then
    
    echo -e "\nin database args are $1 $2 $3 $4"
        query="INSERT INTO user (username,password,email) 
         VALUES ('$2','$3','$4');"
         
         #run query and supress column name  
        mysql -N -h $host -u $name -p$pass $dbname <<<$query

        query_id="SELECT user_id FROM user WHERE username='$2' AND email='$4';"
        
        #run query and save result
        mysql -N -h $host -u $name -p$pass $dbname <<<$query_id >$HOME/.user_id

    elif [ "$1" == "check_password" ];then
    echo -e "\nin database args are $1 $2 $3"
                  
        query_id="SELECT password FROM user WHERE user_id='$(<$2/$3)';"
        
        #run query and save result
        mysql -N -h $host -u $name -p$pass $dbname <<<$query_id >$HOME/.password

    elif [ "$1" == "add_attack" ];then
        query="INSERT INTO blacklist (vendor_id,product_id,device_type) 
         VALUES ('$(<$2${VENDOR_ID})','$(<$2${PRODUCT_ID})','$(<$2${MODEL_ID})');"
        #-N supress column name  
        mysql -N -h $host -u $name -p$pass $dbname <<<$query
        
        query_id="SELECT ${device_id} FROM blacklist WHERE ${vendor_id}='$(<$2${VENDOR_ID})' AND ${product_id}='$(<$2${PRODUCT_ID})';"
        mysql -N -h $host -u $name -p$pass $dbname <<<$query_id >$2$3
        
        query="INSERT INTO attack_log (device_id,user_id) 
         VALUES ('$(<$2$3)','$(<$HOME/.user_id)');"
        #-N supress column name  
        mysql -N -h $host -u $name -p$pass $dbname <<<$query    
    fi
     
}

#call update_database function
update_database $1 $2 $3 $4
