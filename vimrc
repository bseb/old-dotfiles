"#######################
"General Look and Feel#
"#####################
set number
set list!
set listchars=tab:»·,trail:·
"Highlighting
set cursorline
hi CursorLine term=bold cterm=bold 
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
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'rodjek/vim-puppet'
Plugin 'vim-ruby/vim-ruby'
Plugin 'chase/vim-ansible-yaml'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'mklabs/split-term.vim'
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
"Buffers, prefix is leader
" l       : list buffers
" b f g : go back/forward/last-used
" 1 2 3 : go to buffer 1/2/3 etc
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>x :bd<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR
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
"NerdTree
map <F2> :NERDTreeToggle<CR>
"
"split-term
set splitbelow
map <F3> :Term20<CR>
"
