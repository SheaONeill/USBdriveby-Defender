#!/bin/bash 
#
#Application:   USB Driveby Defender
#Authors:         Shea O'Neill, Paddy Cronan
#Date:              20/03/17
#Version:         1.0
#Title:              reset_database.sh
#Description:  This script resets the database
#----------------------------------------------------------------

for (( i=1; i<=5; i++ ));do

    query[1]="DROP TABLE attack_log;DROP TABLE user;DROP TABLE blacklist;"

    query[2]="CREATE TABLE IF NOT EXISTS user (
        user_id INT AUTO_INCREMENT PRIMARY KEY,
        username VARCHAR(10),
        password VARCHAR(255),
        email VARCHAR(30)
        );"

    mysql -udriveby -pdefender defender -e "$query"
    query[3]="CREATE TABLE IF NOT EXISTS blacklist (
        device_id INT AUTO_INCREMENT PRIMARY KEY, vendor_id VARCHAR(4),
        product_id VARCHAR(4),
        device_type VARCHAR(30)
        );"

    mysql -udriveby -pdefender defender -e "$query"
    query[4]="CREATE TABLE IF NOT EXISTS attack_log (
        attack_id INT AUTO_INCREMENT PRIMARY KEY,
        device_id INT, 
        FOREIGN KEY (device_id)
            REFERENCES blacklist(device_id)
            ON DELETE CASCADE,
        user_id INT,
        FOREIGN KEY (user_id)
            REFERENCES user(user_id)
            ON DELETE CASCADE,
        time DATETIME NOT NULL DEFAULT NOW()
        );"
    
    #run query
    ( mysql -udriveby -pdefender defender -e "${query[${i}]}" )  2>&1 > /dev/null

done
