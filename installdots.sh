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
#Install Pathogen.vim to manage vim plugins and download the plugins I use
#pathogen.vim
if [ ! -e ~/.vim/autoload/pathogen.vim ];then
	mkdir -p ~/.vim/autoload
	mkdir -p ~/.vim/bundle
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
	#NerdTree
	/usr/bin/git clone git@github.com:scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
	#Syntastic
	/usr/bin/git clone git@github.com:scrooloose/syntastic.git ~/.vim/bundle/syntastic
	#vim-airline
	/usr/bin/git clone git@github.com:bling/vim-airline.git ~/.vim/bundle/vim-airline
	#Taglist
	/usr/bin/git clone git@github.com/vim-scripts/taglist.vim ~/.vim/bundle/taglist.vim
	#Python Mode
	/usr/bin/git clone git://github.com/klen/python-mode.git ~/.vim/bundle/python-mode
fi

