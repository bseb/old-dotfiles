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
mkdir ~/bin
ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/p10k.zsh ~/.p10k.zsh

#Setup for vim and neovim
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/bundle
ln -sf ~/dotfiles/vimrc ~/.vimrc
ln -sf ~/dotfiles/vimrc ~/.vim/init.vim
ln -sf ~/dotfiles/nvim/lsp_config.lua ~/.vim/lsp_config.lua
ln -sF ~/.vim ~/.config/nvim
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#Add tmux config
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -sf ~/dotfiles/tmux ~/.tmux.conf
ln -sf ~/dotfiles/scripts/tmuxvpn.sh ~/bin/tmuxvpn.sh

# Git config

ln -sf ~/dotfiles/gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
git config --global user.email "ben.sebastian@protonmail.com"
git config --global user.name "Ben Sebastian"
git config --global push.default current
