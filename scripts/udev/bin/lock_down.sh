#!/bin/bash
#
# USB Driveby Defender
#
# Get Standard Input
# This script locks the screen
# 
# 
#---------------------

#todo maybe once admin is contacted close all ports or disable other device drivers eg networking
#othe possible idea scan for newly opened ports
#lock_down
lock_down() {
        #this will lock the screen on gnome (more research for other desktops eg KDE)
        #checkout dbus.freegesktop.org for dbus specs (interprocess communication)        
        dbus-send --type=method_call --dest=org.gnome.ScreenSaver /org/gnome/ScreenSaver org.gnome.ScreenSaver.Lock
	    #
}

#call lock_down function
lock_down
