"#######################
"General Look and Feel#
"#####################
set number
set list!
set listchars=tab:»·,trail:·,eol:¬
"Folding is bad and it should feel bad, and also be disabled
set nofoldenable
"Fix Delay on Esc
set timeoutlen=1000 ttimeoutlen=10

"Highlighting
set cursorline
hi CursorLine term=bold cterm=bold
"Because I forget sudo frequently
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
"backspace should behave like backspace
:set backspace=indent,eol,start
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
Plugin 'tpope/vim-surround.git'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'w0rp/ale'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'rodjek/vim-puppet'
Plugin 'vim-ruby/vim-ruby'
Plugin 'chase/vim-ansible-yaml'
Plugin 'plasticboy/vim-markdown'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'mitsuhiko/vim-python-combined'
Plugin 'fatih/vim-go'
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
nmap <Leader>l :Buffers<CR>
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
nnoremap <Leader>0 :10b<CR>
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
"Ansible
au BufRead,BufNewFile */ansible/*.yml set filetype=ansible
au BufRead,BufNewFile */ansible/*.yaml set filetype=ansible
let g:ansible_unindent_after_newline = 1
"NerdTree
map <F2> :NERDTreeToggle<CR>
"
"Relative Numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc
" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>
"ale
let g:airline#extensions#ale#enabled = 1
let g:ale_puppet_puppetlint_options = '--no-80chars-check --no-class_inherits_from_params_class-check --no-variable_scope-check --no-documentation-check --no-autoloader_layout-check'
let g:ale_yaml_yamllint_options = '-d "{extends: relaxed, rules: {line-length: {max: 1200}}}"'
" Bindings for fzf.vim
nmap <Leader>; :FZF<CR>
