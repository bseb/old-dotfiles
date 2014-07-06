# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
#Use work aliases if on my work machine
if -e [ ~/.workalias ];then
	source ~/.workalias
fi

# User specific aliases and functions
#Vim keybindings instead of emacs
set -o vi 
#Ignore duplicate history entries 
export HISTCONTROL=ignoredups
#

#Aliases 
alias ll='ls -alht'

