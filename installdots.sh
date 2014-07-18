#!/bin/bash

#Are we using awesomewm on this machine?
if [ -e /etc/xdg/awesome/rc.lua ]; then
	mkdir -p ~/.config/awesome
	rm -r ~/.config/awesome/rc.lua
	ln -s ~/dotfiles/rc.lua ~/.config/awesome/rc.lua
fi
#Assume that if we are in runlevel 5 that we have x running
if [ "$(runlevel | awk '{ print $2 }')" -eq 5 ]; then
	rm -r ~/.xmodmap
	ln -s ~/dotfiles/xmodmap ~/.xmodmap
fi
# Remove existing dotfiles if present
rm -r ~/.vimrc ~/.screenrc ~/.bashrc ~/.tmux.conf
#Link files in dotfiles to where they go
ln -s ~/dotfiles/bashrc ~/.bashrc 
ln -s ~/dotfiles/vimrc ~/.vimrc
if [ -e /usr/bin/screen ];then
	ln -s ~/dotfiles/screenrc ~/.screenrc
fi
if [ -e /usr/bin/tmux ];then
	ln -s ~/dotfiles/tmux ~/.tmux.conf
fi
#Install Pathogen.vim to manage vim plugins and download the plugins I use
#pathogen.vim
if [ ! -e ~/.vim/autoload/pathogen.vim ];then
	mkdir -p ~/.vim/autoload
	mkdir -p ~/.vim/bundle
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
	#NerdTree
	/usr/bin/git clone git@github.com:scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
	#neocomplcache
	/usr/bin/git clone git@github.com:Shougo/neocomplcache.vim.git ~/.vim/bundle/neocomplcache.vim
fi

