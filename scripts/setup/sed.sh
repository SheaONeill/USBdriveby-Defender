#!/bin/bash
#
#
ARGS=3
#find and replace with sed
sed -i 's/'$1'/'$2'/' $3

if [ $# -ne $ARGS ];then
    echo -e "\nUsage: $0 text to find, text to replace, filename Arguments are not satisfied"
fi
