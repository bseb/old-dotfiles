# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
#Use work aliases if on my work machine
if [ -e ~/.workalias ];then
	source ~/.workalias
fi
#Ignore duplicate history entries 
export HISTCONTROL=ignoredups
#

#Aliases 
alias tmove='tmux detach && tmux attach'
alias tma='tmux attach'
alias ll='ls -alht'
alias wq='exit'
alias :wq='exit'
# Hostname in GNUscreen Window Title 
#if [ $TERM = "screen" ] || [ $TERM = "screen-256color" ]; then
#   PROMPT_COMMAND='echo -ne "\033k$HOSTNAME\033\\"'
#   export PROMPT_COMMAND
#fi
# Remap capslock to ctrl
setxkbmap -option ctrl:nocaps

export GOPATH=$HOME/.go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
