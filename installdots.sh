#!/bin/bash

#Are we using awesomewm on this machine?
if [ -e /etc/xdg/awesome/rc.lua ]; then
	mkdir -p ~/.config/awesome
	rm -r ~/.config/awesome/rc.lua
	ln -s ~/dotfiles/rc.lua ~/.config/awesome/rc.lua
fi
#How About i3wm
if [ -e /usr/bin/i3 ];then
	mkdir -p  ~/.i3
    ln -s ~/dotfiles/i3config ~/.i3/config
fi
# Remove existing dotfiles if present
rm -r ~/.vimrc ~/.screenrc ~/.bashrc ~/.Xdefaults
#Link files in dotfiles to where they go
ln -s ~/dotfiles/bashrc ~/.bashrc
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/Xdefaults ~/.Xdefaults
#Multiplexers a-gogo
if [ -e /usr/bin/screen ];then
	ln -s ~/dotfiles/screenrc ~/.screenrc
fi
if [ -e /usr/bin/tmux ];then
	rm -rf ~/.tmux.conf
	ln -s ~/dotfiles/tmux ~/.tmux.conf
fi
#oh-my-zsh setup
if [ -e /usr/bin/zsh ] || [ -e /bin/zsh ];then
	ln -s ~/dotfiles/oh-my-zsh ~/.oh-my-zsh
	ln -s ~/dotfiles/zshrc ~/.zshrc
fi
#Install Vundle to manage Vim plugins
#pathogen.vim
if [ ! -e ~/.vim/bundle/Vundle.vim ];then
	mkdir -p ~/.vim/autoload
	mkdir -p ~/.vim/bundle
	/usr/bin/git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
