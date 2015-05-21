"#######################
"General Look and Feel#
"#####################
set number 
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40
filetype off
syntax on
set tabstop=4
"Because I forget sudo frequently
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
"########
"Plugins#
"#######
"Pathogen Load TODO make this check for installed pathogen
execute pathogen#infect()
"generate helptags for everything in ‘runtimepath’
call pathogen#helptags()
filetype plugin indent on 
syntax on
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
