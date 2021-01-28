#!/bin/bash

#MacOS Specific
if [[ $( uname ) == 'Darwin' ]]; then
  if [[ ! -e /usr/local/bin/brew ]]; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
  /usr/local/bin/brew tap Homebrew/bundle
  /usr/local/bin/brew bundle --file=~/dotfiles/Brewfile
  ln -sf ~/dotfiles/Brewfile ~/Brewfile
  ln -sf ~/Library/Mobile\ Documents/com\~apple\~CloudDocs ~/iCloud
  if [[ ! -e  ~/.fzf.zsh ]]; then
     $(brew --prefix)/opt/fzf/install
  fi
fi

#Shell Setup.
if [[ ! -e ~/anitgen.zsh ]]; then
    curl -L git.io/antigen > ~/antigen.zsh
fi
ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/p10k.zsh ~/.p10k.zsh

#Setup for vim and neovim
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/bundle
ln -sf ~/dotfiles/vimrc ~/.vimrc
ln -sf ~/dotfiles/vimrc ~/.vim/init.vim
ln -sF ~/.vim ~/.config/nvim
/usr/bin/git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c PluginInstall -c :q! -c:q!

#Add tmux config
ln -sf ~/dotfiles/tmux ~/.tmux.conf

# Git config

ln -sf ~/dotfiles/gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
git config --global user.email "ke8hnb@protonmail.com"
git config --global user.name "Ben Sebastian"
git config --global push.default current
