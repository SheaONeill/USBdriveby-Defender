#!/bin/bash
#
# USB Driveby Defender
#
# Read Characters
# This script reads a single character from stdin
# and checks for line breaks
#---------------------

#encrypt password
decryption=$(mkpasswd --method=sha512 --salt=$salt $pass )
