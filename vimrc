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
"Plugins Managed by Vundle
Plugin 'tpope/vim-fugitive'
Plugin 'klen/python-mode'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'pearofducks/ansible-vim'
Plugin 'rodjek/vim-puppet'
"End Vundle
call vundle#end()
filetype plugin indent on
syntax on
let mapleader = "\<Space>"
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
"Airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_gutter = '%= %{strftime("%R")}'
let g:airline_powerline_fonts = 1
"Fugitive
set statusline=%{fugitive#statusline()}

