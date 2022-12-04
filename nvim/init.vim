source $HOME/space/config-files/nvim/autoload/plugged/lotus/lotus.vim
source $HOME/space/config-files/nvim/autoload/plugged/lotus/lotusbar.vim
source $HOME/space/config-files/nvim/vim-plug/plugins.vim

" General
syntax enable
set mouse=a
set number
set relativenumber
set encoding=utf-8
set clipboard=unnamedplus

set nolist
set showmatch
set noshowmode
set showcmd
set termguicolors
set cursorline
set hlsearch
set incsearch
set ignorecase
set t_Co=256
set laststatus=2
set fileformat=unix
set colorcolumn=120

" Tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set smartcase
set smartindent
filetype indent on

" Keybinding
nnoremap <C-[> :tabr<cr>
nnoremap <C-]> :tabl<cr>
nnoremap <space>x :wq!<CR>

let g:indentLine_color_gui = '#ea4c88'
let g:indentLine_char = '⏽ '

" theme
colorscheme onehalfdark2
"let g:airline_theme='onehalfdark'
" lightline
"let g:lightline = { 'colorscheme': 'onehalfdark' }
