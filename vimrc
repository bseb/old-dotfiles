"#######################
"General Look and Feel#
"#####################
set number 
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40
filetype plugin indent on
syntax on
"########
"Plugins#
"#######
"Pathogen Load TODO make this check for installed pathogen
execute pathogen#infect()
"generate helptags for everything in ‘runtimepath’
call pathogen#helptags()
"###########
"Navigation#
"##########
" Use ctrl-[hjkl] to select the active split
 nmap <silent> <c-k> :wincmd k<CR>
 nmap <silent> <c-j> :wincmd j<CR>
 nmap <silent> <c-h> :wincmd h<CR>
 nmap <silent> <c-l> :wincmd l<CR>
 "Edit remote files with rsync and sudo TODO
let g:netrw_rsync_cmd='rsync  --rsync-path="sudo rsync"'
