#Load Antigen
source ~/dotfiles/antigen.zsh
#Load OMZsh
antigen use oh-my-zsh
# OMZsh plugins
antigen bundle git
antigen bundle osx
antigen bundle docker
antigen bundle vagrant
# Antigen theme
antigen theme candy
# Other Plugins
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply
# aliases and functions
# Use work aliases if on my work machine
if [ -e ~/.workalias ];then
        source ~/.workalias
fi
# Tmux
alias tmove="tmux detach && tmux attach"
alias tma="tmux attach-session -t"
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
#General Shell stuff
alias ll="ls -alht"
alias wq="exit"
alias :wq="exit"
unset GREP_OPTIONS
alias grep="grep --color=auto --exclude-dir=.cvs --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn"
alias vim="nvim"
alias sshKeyUnlock="eval `ssh-agent -s` ; ssh-add"
#Fix tab completion weirdness
export LC_ALL=en_US.UTF-8
#Add fuzzy finder support
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
