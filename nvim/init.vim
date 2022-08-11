syntax enable
set nolist
set rnu
set number
set showmatch
set noshowmode
set showcmd
set termguicolors
set expandtab
set autoindent
set cursorline
set hlsearch
set incsearch
set ignorecase
set smartcase
set mouse=a
set laststatus=2
set encoding=utf-8
set fileformat=unix
set colorcolumn=120
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

nnoremap <space>x :wq!<CR>

let g:indentLine_color_gui = '#ea4c88'
let g:indentLine_char = '⏽ '

source $HOME/.config/nvim/lotus.vim
source $HOME/.config/nvim/lotusbar.vim

colorscheme nord
