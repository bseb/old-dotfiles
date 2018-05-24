#!/bin/bash

#Install Homebrew on Mac
if [[ $( uname ) == 'Darwin' ]]; then
  if [[ ! -e /usr/local/bin/brew ]]; then
    mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
  fi
  /usr/local/bin/brew tap Homebrew/bundle
  ln -sf ~/dotfiles/Brewfile ~/Brewfile
fi

#Shell Setup.
ln -sf ~/dotfiles/zshrc ~/.zshrc

#Setup for vim and neovim
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/bundle
ln -sf ~/dotfiles/vimrc ~/.vimrc
ln -sf ~/dotfiles/vimrc ~/.vim/init.vim
ln -sF ~/.vim ~/.config/nvim
/usr/bin/git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#Add tmux config
ln -sf ~/dotfiles/tmux ~/.tmux.conf

# Git config

ln -sf ~/dotfiles/gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
git config --global user.email "bsebastian0512@gmail.com"
git config --global user.name "Ben Sebastian"