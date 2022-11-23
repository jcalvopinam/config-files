source $HOME/.config/nvim/autoload/plugged/lotus/lotus.vim
source $HOME/.config/nvim/autoload/plugged/lotus/lotusbar.vim
source $HOME/.config/nvim/vim-plug/plugins.vim

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
set t_Co=256
set laststatus=2
set encoding=utf-8
set fileformat=unix
set colorcolumn=120
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

nnoremap <space>x :wq!<CR>

let g:indentLine_color_gui = '#ea4c88'
let g:indentLine_char = '⏽ '

" theme's name
colorscheme onehalfdark
"let g:airline_theme='onehalfdark'
" lightline
let g:lightline = { 'colorscheme': 'onehalfdark' }
