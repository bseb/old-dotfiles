#!/bin/bash
# Remove existing dotfiles if present
rm -r ~/.vimrc ~/.screenrc ~/.xmodmap ~/.bashrc
rm -r ~/.config/awesome/rc.lua
#Make directory for awesomewm rc.lua
mkdir -p ~/.config/awesome
#Link files in dotfiles to where they go
ln -s ~/dotfiles/bashrc ~/.bashrc 
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/screenrc ~/.screenrc
ln -s ~/dotfiles/xmodmap ~/.xmodmap
ln -s ~/dotfiles/rc.lua ~/.config/awesome/rc.lua

