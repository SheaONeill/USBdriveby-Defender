#!/bin/bash

# Author James O'Neill
# B00084432
# UpDated: 20-10-16
# Version 1.0.<lost count>

# This script is to stop wannabee hackers
# plugging in a USB into my laptop
# to run an attack on my machine
# You don't mess with the best!

# to do: make script run when usb is inserted
# to do: try to use -d for defaults and supress all warnings :)
# can this be done hmm

# how to make this file executable:
# chmod +x <file-name>.sh 
# how to run script
# ./<file-name>.sh 
# verify: verify this by running ls -l <file-name>.sh 
echo "Testing Create Image of USB and Encrypting"
# this is a comment in a bash script
# the echos and inputs are just for testing
# and won't be in the final script
# otherwise i will give the game away :)
echo "where do you want to save the image file?"
echo "e.g. /root/Documents/<folder-name>"
# get user input for variable folderName
read folderName
# create the new folder 
# Using the form with quotes (mkdir "$deployDir") is recommended in case the target directory name includes spaces.
mkdir "$folderName"
# change to the new directory
cd $folderName
# display the current path
echo "we are now in directory"
pwd
echo "Do you want to continue to the next step? [Y/n]"
read continueON
if [ "$continueON" = "Y" ] || [ "$continueON" = "y" ]; then
echo "\$continueON = $continueON"
echo "You Chose to continue!"
continueON = ""
else
echo "\$continueON = $continueON"
echo "You Chose Not to continue!"
exit 
# fi closes the if statment
fi
echo "Here are all Device details"
dmesg | grep "\[sd"
echo -n "Enter the USB drive to wipe eg /dev/sdb?: "
# -n: do not output the trailing newline
read targetUSB
echo "Hello, you selected $targetUSB"
echo "About to unmount $targetUSB"
umount $targetUSB
echo "$targetUSB unmounted"
echo "Ready to image $targetUSB to location $folderName/forensic=image.dd"
echo "Do you want to continue to the next step? [Y/n]"
read continueON
if [ "$continueON" = "Y" ] || [ "$continueON" = "y" ]; then
echo "\$continueON = $continueON"
echo "You Chose to continue!"
continueON = ""
else
echo "\$continueON = $continueON"
echo "You Chose Not to continue!"
exit 
# fi closes the if statment
fi
# $targetUSB is the USB drive to wipe eg /dev/sdb
# $folderName is where we want to copy it
dcfldd if=$targetUSB of=/$folderName/forensic-image.dd

#now get the md5sum of the image
md5=($(md5sum forensic-image.dd))
echo "$md5"

# save md5 hash to a file
# The if tests that $destdir represents a file.
# destdir=/some/directory/path/filename

# The > appends the text after truncating the file. 
# If you only want to append the text in $var to the file existing contents, then use >> instead:
# echo "$md5" >> "md5hash.txt"
echo "$md5" > md5hash.txt

echo "Calculated md5Hash of forensic-image.dd is : $md5"
echo -n "md5text file contents now: "
cat md5hash.txt

# mounting the drive don't need this
# might be handy for digital forensics module tho

# create a directory for nounting the image
mkdir /mnt/test
# mount the file
mount forensic-image.dd /mnt/test


#working so far
# next is to encrypt the drive
# See How_to.txt

# next is to wipe the drive just for extra measure :)

echo "Ready to wipe $targetUSB 6 Times with Zeros and random data"
echo "Do you want to continue to the next step? [Y/n]"
read continueON
if [ "$continueON" = "Y" ] || [ "$continueON" = "y" ]; then
echo "\$continueON = $continueON"
echo "You Chose to continue!"
continueON = ""
else
echo "\$continueON = $continueON"
echo "You Chose Not to continue!"
exit 
# fi closes the if statment
fi

echo "You are about to overwrite usb $targetUSB with zeroes"
dd if=/dev/zero  of=$targetUSB bs=1M status=progress
echo "USB_WIPE_ZERO's Stage 1 has completed"
echo "You are about to overwrite usb $targetUSB with random data:"
dd if=/dev/urandom of=$targetUSB bs=1M status=progress
echo "USB_WIPE_RANDOM.sh Stage 2 has completed"
echo "You are about to overwrite usb $targetUSB with zeroes"
dd if=/dev/zero  of=$targetUSB bs=1M status=progress
echo "USB_WIPE_ZERO's Stage 3 has completed"
echo "You are about to overwrite usb $targetUSB with random data:"
dd if=/dev/urandom of=$targetUSB bs=1M status=progress
echo "USB_WIPE_RANDOM.sh Stage 4 has completed"
echo "You are about to overwrite usb $targetUSB with zeroes"
dd if=/dev/zero  of=$targetUSB bs=1M status=progress
echo "USB_WIPE_ZERO's Stage 5 has completed"
echo "You are about to overwrite usb $targetUSB with random data:"
dd if=/dev/urandom of=$targetUSB bs=1M status=progress
echo "USB_WIPE_RANDOM.sh Stage 6 has completed"

# now im goimg to try to put the image back onto the usb
# create partition
# targetUSB="/dev/sdb"
# folderName="/root/Documents/test6"
echo Creating Partition on "$targetUSB"
sudo fdisk $targetUSB
# append 1 onto variable
num="1"
fatPart="$targetUSB$num"
echo "FatPart = $fatPart"
# format to fat
echo "Formating Partition on $fatPart"
sudo mkfs.vfat $fatPart
# copy image back to usb
echo "Putting forensic-image.dd Back onto $targetUSB"
dd if=$folderName/forensic-image.dd of=$targetUSB status=progress
echo "Mission Complete!!"
clear

