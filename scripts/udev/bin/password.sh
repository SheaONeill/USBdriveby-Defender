#!/bin/bash
#
# USB Driveby Defender
#
# Read Characters
# This script reads a single character from stdin
# and checks for line breaks
#---------------------

#encrypt password
encrypt_password () {
    decryption=$(mkpasswd --method=sha512 --salt=$salt $pass )
    #finish this
}

#call encrypt_password function
encrypt_password
