# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Use homebrew stuff
export PATH="/usr/local/bin:/usr/local/opt/curl/bin:$PATH"
#Load Znap
source ~/zsh-snap/znap.zsh
#Znap Theme
znap prompt romkatv/powerlevel10k
#Znap Plugins
znap source marlonrichert/zsh-autocomplete
znap source MichaelAquilina/zsh-autoswitch-virtualenv
znap source zsh-users/zsh-syntax-highlighting

# aliases and functions
# Use work aliases if on my work machine
if [ -e ~/.workalias ];then
        source ~/.workalias
fi
# Tmux
alias tmove="tmux detach && tmux attach"
alias tma="tmux attach-session -t"
alias tnew="tmux new-session -d -s $1"
#Vagrant
alias vd="vagramt destroy"
alias vg="vagrant global-status"
alias vh="vagrant halt $1"
alias vr="vagrant ssh $1 -c 'sudo su -'"
alias vs="vagrant status"
alias vssh="vagrant ssh $1"
alias vu="vagrant up $1"
#GOLANG Stuff
export GOPATH=$HOME/workspace/go
export PATH=$GOPATH/bin:$PATH
#Git Alias
alias gps="git push -u"
alias gpl="git pull"
alias gco="git checkout"
alias uncommit="reset --soft HEAD^"
alias unstage="reset"
alias staged="diff --cached"
if [[ -a $(which hub) ]]
then
    eval $( hub alias -s)
    alias gpr="hub pull-request"
    alias gpl="hub sync"
    alias gci="hub ci-status"
fi
cdt() {
    cd `git rev-parse --show-toplevel`
}
#General Shell stuff
alias ll="ls -alht"
alias wq="exit"
alias :wq="exit"
unset GREP_OPTIONS
alias grep="grep --color=auto --exclude-dir=.cvs --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn"
#Map caps to ctrl
if [ `uname` = "Linux" ]; then
    /usr/bin/setxkbmap -option "ctrl:nocaps"
fi
#Vim selection
if [[ -a $(which nvim) ]]; then
    alias vim="nvim"
    export EDITOR=nvim
elif [ -f "/usr/local/bin/vim" ]; then
   alias vim="/usr/local/bin/vim"
   export EDITOR=vim
fi
if [ `uname` = "Darwin" ]; then
    alias sshKeyUnlock="eval `ssh-agent -s` ; ssh-add -K"
else
    alias  sshKeyUnlock="eval `ssh-agent -s` ; ssh-add"
fi

#Fix tab completion weirdness
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color
#Add fuzzy finder support
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Silly Weather Function
weather() {
    curl http://v2.wttr.in/$1
}

# Set BUNNYPATH for Bash Bunny updates

EXPECTED_LOCATION=/Volumes/BashBunny
if [[ -d $EXPECTED_LOCATION ]]; then
    export BUNNYPATH=$EXPECTED_LOCATION
fi

# OpenSSL Aliases for stuff I forget all the time and have to look up
s_client() {
    openssl s_client -connect ${1}:443
}
view_cert() {
    openssl x509 -in $1 -noout -text
}
# Copy and paste from terminal to clipboard
if [[ `uname` == "Linux" ]]; then
    alias clip="xclip -i -selection clipboard"
elif [[ `uname` == "Darwin" ]]; then
    alias clip="pbcopy"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#Axiom config

if [ -e ~/.axiom ]; then
    export PATH="$PATH:$HOME/.axiom/interact"
    source /home/ben/.axiom/functions/autocomplete.zsh
    compdef _axiom-ssh axiom-rm
    compdef _axiom-ssh axiom-ssh
    compdef _axiom-ssh axiom-select
    compdef _axiom-ssh axiom-backup
    compdef _axiom-ssh axiom-vpn
    compdef _axiom-restore axiom-restore
    compdef _axiom-deploy axiom-deploy
    export PATH="$PATH:$HOME/.axiom/interact"
    source /home/ben/.axiom/functions/autocomplete.zsh
    compdef _axiom-ssh axiom-rm
    compdef _axiom-ssh axiom-ssh
    compdef _axiom-ssh axiom-select
    compdef _axiom-ssh axiom-backup
    compdef _axiom-ssh axiom-vpn
    compdef _axiom-restore axiom-restore
    compdef _axiom-deploy axiom-deploy
fi
