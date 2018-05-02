# Before running brew bundle run brew tap Homebrew/bundle
#https://github.com/Homebrew/homebrew-bundle
tap "caskroom/cask"
tap "caskroom/fonts"
tap "homebrew/bundle"
tap "homebrew/core"
brew "ruby"
brew "python"
brew "ipython"
brew "ansible" unless `hostname`.include? "CMM"
brew "ansible-lint" unless `hostname`.include? "CMM"
brew "git"
brew "pass"
brew "tmux"
brew "fzf"
brew "wget"
brew "rbenv"
brew "terraform"
brew "lastpass-cli"
brew "packer"
brew "vim", args:["with-override-system-vim"] 
brew "vault"
brew "pipenv"
brew "coreutils"
cask "font-hack"
cask "minikube"
cask "vagrant"
cask "virtualbox"
cask "iterm2"
cask "xscreensaver"
