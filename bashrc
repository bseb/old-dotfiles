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
export PS1="\[\e[00;37m\][\$?][\[\e[0m\]\[\e[00;32m\]\w\[\e[0m\]\[\e[00;37m\]][\[\e[0m\]\[\e[00;36m\]\t\[\e[0m\]\[\e[00;37m\]]\n\u@\[\e[0m\]\[\e[00;31m\]\h\[\e[0m\]\[\e[00;37m\]\\$>"
#Vim keybindings instead of emacs
set -o vi 
#Ignore duplicate history entries 
export HISTCONTROL=ignoredups
#

#Aliases 
alias ll='ls -alht'
# Hostname in GNUscreen Window Title 
#if [ $TERM = "screen" ] || [ $TERM = "screen-256color" ]; then
#   PROMPT_COMMAND='echo -ne "\033k$HOSTNAME\033\\"'
#   export PROMPT_COMMAND
#fi
# Remap capslock to ctrl
setxkbmap -option ctrl:nocaps
