#!/bin/bash 
#
#Application:   USB Driveby Defender
#Authors:         Shea O'Neill, Paddy Cronan
#Date:              20/03/17
#Version:         1.0
#Title:              lock_down.sh
#Description:  This script locks the screen
#----------------------------------------------------------

lock_down() {

    #this will lock the screen on gnome (more research for other desktops eg KDE)
    #checkout dbus.freegesktop.org for dbus specs (interprocess communication)        
    dbus-send --type=method_call --dest=org.gnome.ScreenSaver /org/gnome/ScreenSaver org.gnome.ScreenSaver.Lock
	 
}

#call lock_down function
lock_down
