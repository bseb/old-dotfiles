"#######################
"General Look and Feel#
"#####################
"Relative Line Numbers
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
"Highlighting
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40
"Duh
set tabstop=4
"Because I forget sudo frequently
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
"########
"Plugins#
"#######
"Vundle requirements
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
"Start Vundle
call vundle#begin()
"Vundle use git(ssh) instead of http
"Use ssh on my personal machines,default at work
if $HOSTNAME != "defiant"
	let g:vundle_default_git_proto = 'ssh'
endif
"Plugins Managed by Vundle
Plugin 'tpope/vim-fugitive'
Plugin 'klen/python-mode'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
"End Vundle
call vundle#end()
filetype plugin indent on
"###########
"Navigation#
"##########
" Use ctrl-[hjkl] to select the active split
 nmap <silent> <c-k> :wincmd k<CR>
 nmap <silent> <c-j> :wincmd j<CR>
 nmap <silent> <c-h> :wincmd h<CR>
 nmap <silent> <c-l> :wincmd l<CR>
"#################
"#Plugin Settings#
"#################
set laststatus=2
