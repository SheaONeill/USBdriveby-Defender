# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#--------------------------------------------------------------------------------------
#
# USB Driveby Defender
#
#
#---------------------

# note
# we could always create a new file bash_driveby_defender
if [ -f ~/.bash_driveby_defender ]; then
    . ~/.bash_driveby_defender
fi
#
#check  values when shells are executed
echo "In .bashrc Now!"
#
#set the log path variable
LOG_PATH="/var/log/driveby_defender/"

#check if .keyboard_flag exists
if [ -f ${LOG_PATH}.keyboard_flag ]; then
echo -e "\nTest in if keyboard flag exists"
    #script import to get paths and log details
    source /usr/local/bin/export_paths.sh "63-usb-kbd.rules" "keyboard_details.log" "/sys/bus/usb/drivers/usbhid/" ".keyboard_flag"
   
    echo -e "\nTest in if after exports"
    
    #check to see if flag is set
   if  [[ $(head -1 ${LOG_PATH}${FLAG}) == 1 ]] ;then
   echo -e "\nTest in if keyboard flag equals 1"
    source /usr/local/bin/log_details.sh $BASH_SOURCE "Setting_keyboard_paths"
    echo -e "\nTest in if after logs"
        echo "A ${FLAG} has been Detected!"
        #echo -e "\nDEVICE_PATH= ${DEVICE_PATH}"
        #echo -e "\nDEVICE_PATH= ${DEVICE_LOG_NAME}"
        #echo -e "\nDEVICE_PATH= ${DEVICE_DRIVER_LOG_NAME}"
	    #check database blacklist
	     /usr/local/bin/check_blacklist.sh               
	    #call get_input.sh
        /usr/local/bin/get_input.sh
    elif  [[ $(head -1 ${LOG_PATH}${FLAG}) == 0 ]] ;then
        echo "No ${FLAG} is set!!"
    fi
fi
#
#check if .flash_flag exists
if [ -f ${LOG_PATH}.flash_flag ] ; then
    echo -e "\nTest in if flash flag exists"
     
    #script import to get paths and log details
    source /usr/local/bin/export_paths.sh "81-usb-flash.rules" "flash_details.log" "/sys/bus/usb/drivers/usb-storage/" ".flash_flag"
     
    #check to see if flag is set
    if  [[ $(head -1 ${LOG_PATH}${FLAG}) == 1 ]] ;then
	    echo -e "\nTest in if flash flag equals 1"
	    source /usr/local/bin/log_details.sh $BASH_SOURCE "Setting_keyboard_paths"
        echo -e "\nTest in if after logs"
	    echo "A ${FLAG} has been Detected!"
	    #check database blacklist
	     /usr/local/bin/check_blacklist.sh       
	    #call get_input.sh
        /usr/local/bin/get_input.sh
    elif  [[ $(head -1 ${LOG_PATH}${FLAG}) == 0 ]] ;then
        echo "No ${FLAG}  is set!"
        
    fi
#
else
	echo "No Device has been Detected!"
fi
#reload rules so change will take affect
udevadm control --reload-rules && udevadm trigger  
#--------------------------------------------------------------------------------------
