# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="nebirhos"


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="candy"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
 ZSH_CUSTOM=~/dotfiles/zsh_custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git pip python zsh-syntax-highlighting docker docker-machine vagrant osx brew  )

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:/usr/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"


# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
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
