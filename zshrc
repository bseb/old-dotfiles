# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Use homebrew stuff
export PATH="~/bin:/usr/local/bin:/usr/local/opt/curl/bin:$PATH"
#Load Znap
source ~/zsh-snap/znap.zsh
#Znap Theme
znap prompt romkatv/powerlevel10k
#Znap Plugins
znap source zsh-users/zsh-syntax-highlighting
znap source MichaelAquilina/zsh-autoswitch-virtualenv

export LANG="en_US.UTF-8"

# aliases and functions
# Use per machine aliases for things I dont want in git
if [ -e ~/.localalias ];then
        source ~/.localalias
fi
# Share history between sessions
setopt share_history

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
if [[ -a $(which gh) ]]
then
    alias gpr="gh pr create"
    alias gpl="gh repo sync"
    alias gci="gh pr checks"
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

# nnn config
export NNN_OPTS="eEnrx"
export NNN_TMPFILE='/tmp/.lastd'

#Fix tab completion weirdness
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color

#Add fuzzy finder support
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Silly Weather Function
weather() {
    curl http://v2.wttr.in/$1
}

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

# Case-insensitive autocomplete
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
setopt no_list_ambiguous
