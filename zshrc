#Load Antigen
ANTIGEN_CACHE=false
source ~/dotfiles/antigen.zsh
#Load OMZsh
antigen use oh-my-zsh
antigen theme 0i0/0i0.zsh-theme
# OMZsh plugins
antigen bundle osx
antigen bundle docker
antigen bundle vagrant
# Other Plugins
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle bseb/dockerMachineZsh
antigen bundle bseb/containerShellZsh
antigen bundle oldratlee/hacker-quotes
antigen bundle kiurchv/asdf.plugin.zsh
# Apply Antigen config
antigen apply
# aliases and functions
# Spaceship stuff
SPACESHIP_KUBECONTEXT_SHOW=false
# Use work aliases if on my work machine
if [ -e ~/.workalias ];then
        source ~/.workalias
fi
# Tmux
alias tmove="tmux detach && tmux attach"
alias tma="tmux attach-session -t"
alias tnew="tmux new-session -d -s $1"
#Vagrant
vd() {
    for VAGRANT_HOST in $@; do
        cert_name=$(vagrant ssh puppet -c "sudo puppet cert list -all" 2> /dev/null|grep "${VAGRANT_HOST}-${USER}\.dev.*"|awk '{gsub("\"", "", $2);print $2}')
        echo -n "Press ENTER to delete ${cert_name}..."
        read
        vagrant ssh puppet -c "sudo puppet cert clean ${cert_name}"
        vagrant destroy -f ${VAGRANT_HOST}
    done
}
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
alias gps="git push"
alias gpl="git pull"
alias gco="git checkout"
alias uncommit="reset --soft HEAD^"
alias unstage="reset"
alias staged="diff --cached"
#General Shell stuff
alias ll="ls -alht"
alias wq="exit"
alias :wq="exit"
unset GREP_OPTIONS
alias grep="grep --color=auto --exclude-dir=.cvs --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn"
alias vim="/usr/local/bin/vim"
alias sshKeyUnlock="eval `ssh-agent -s` ; ssh-add"
#Fix tab completion weirdness
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color
#Add fuzzy finder support
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#ASDF stuff
. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash
# Use homebrew curl
export PATH="/usr/local/opt/curl/bin:$PATH"
