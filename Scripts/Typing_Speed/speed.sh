#!/bin/sh
# speed.sh: a very tiny utility to measure typing speed.
#formula typing_speed_in_wpm = num_words / ( (end_time - start_time) / 60 )
#
#ref:http://www.linuxjournal.com/content/how-fast-can-you-type-develop-tiny-utility-bash-find-out


#cat: Officially it concatenates files and print them on the standard output. 
#Practically it can grab your input from the keyboard and via a pipe send that to the wc. 
#In other words all we need to do to count the number of words 
#we just typed is to issue the following command: cat | wc -w
#

prompt="Start typing text. Press Ctrl-d twice to finish."
echo $prompt

#date: This is our well-known utility and if you use it with the %s format specifier it returns 
#the “seconds since 1970-01-01 00:00:00 UTC”. 
#So if you run date +%s once at the beginning of your typing session and 
#once at the end of it, you’ll have the end_time and start_time.
#
start_time=`date +%s`

#wc: This is yet another well-known utility that can give you the number of words in a file
#if invoked with -w option. And remember, in GNU/Linux almost everything is a file, 
#including your input from the keyboard.
#
#words=`cat|wc -w`

chars=`wc -m`


end_time=`date +%s`

#bc: Officially it is an arbitrary precision calculator language. 
#Practically it is a very handy utility if you want to do calculations within the command line. 
#But you have to be careful and read its manual page. 
#

#if you use wc -m, it will not bail out when you press a carriage return
words=`echo "scale=2; $chars / 5" | bc`



speed=`echo "scale=2; $words / ( ( $end_time - $start_time ) / 60)" | bc`




echo -e "\nYour typing speed was $speed words per minute."
