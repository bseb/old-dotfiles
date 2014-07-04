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
rm -r ~/.vimrc ~/.screenrc ~/.bashrc
#Link files in dotfiles to where they go
ln -s ~/dotfiles/bashrc ~/.bashrc 
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/screenrc ~/.screenrc

