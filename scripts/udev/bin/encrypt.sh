#!/bin/bash
#
# USB Driveby Defender
#
# encrypt file
# 
# 
# 
#---------------------




SECRETFILE=$1

if [[ -z "SECRETFILE" ]];then
    echo "WTF"
    exit
fi

openssl des3 -salt -in "$SECRETFILE" -out "$SECRETFILE.des3"

