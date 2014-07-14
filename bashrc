# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
#Use work aliases if on my work machine
if [ -e ~/.workalias ];then
	source ~/.workalias
fi
#Fancy prompt
export PS1="[\w][$(echo $?)]\n\u@\h\$>"

#Vim keybindings instead of emacs
set -o vi 
#Ignore duplicate history entries 
export HISTCONTROL=ignoredups
#

#Aliases 
alias ll='ls -alht'

