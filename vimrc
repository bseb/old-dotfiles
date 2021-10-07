"#######################
"
"#####################
set number
set list!
set listchars=tab:»·,trail:·

"Folding is bad and it should feel bad, and also be disabled
set nofoldenable

"Fix Delay on Esc
set timeoutlen=1000 ttimeoutlen=10

"Highlighting
set cursorline
hi CursorLine term=bold cterm=bold
hi CursorLineNR ctermbg=cyan

"Because I forget sudo frequently
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

"backspace should behave like backspace
:set backspace=indent,eol,start

"remamp esc to jj and jk
imap jj <Esc>
imap jk <Esc>
"########
"Plugins#
"#######
"Vundle requirements
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
"Start Vundle
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"Plugins Managed by Vundle
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround.git'
Plugin 'ourigen/skyline.vim'
Plugin 'chase/vim-ansible-yaml'
Plugin 'plasticboy/vim-markdown'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'martinda/Jenkinsfile-vim-syntax'
Plugin 'stephpy/vim-yaml'
Plugin 'jamessan/vim-gnupg'
Plugin 'robertbasic/vim-hugo-helper'
Plugin 'neovim/nvim-lspconfig'
Plugin 'kabouzeid/nvim-lspinstall'
Plugin 'nvim-lua/completion-nvim'
Plugin 'luukvbaal/nnn.nvim'


"End Vundle
call vundle#end()

filetype plugin on
syntax on
set tabstop=4 shiftwidth=4
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

"Skyline
let g:skyline_fugitive = 1
"Fugitive
set statusline=%{fugitive#statusline()}
"Ansible
au BufRead,BufNewFile */ansible/*.yml set filetype=ansible
au BufRead,BufNewFile */ansible/*.yaml set filetype=ansible
let g:ansible_unindent_after_newline = 1
"Completion
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

"
" fzf.vim
let g:fzf_files_options =
      \ '--preview-window top:60% ' .
      \ '--preview "(bat --color "always" {} || cat {}) 2> /dev/null | head -'
      \ . &lines . '"'

nmap <Leader>; :Files<CR>
nmap <Leader>' :Rg<CR>

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

au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,*.mdwn,*.md  set ft=markdown

" LSP Config
sign define LspDiagnosticsSignError text=🔴
sign define LspDiagnosticsSignWarning text=🟠
sign define LspDiagnosticsSignInformation text=🔵
sign define LspDiagnosticsSignHint text=🟢
luafile ~/.vim/lsp_config.lua
" nnn-vim
map <F2> :NnnExplorer<CR>
lua << EOF
require("nnn").setup()
EOF
