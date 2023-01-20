"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set mouse=a
set number

set relativenumber
augroup relative_number
    autocmd!
    " autocmd InsertEnter * :set norelativenumber
    " autocmd InsertLeave * :set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    " Fix syntax highlighting
    autocmd BufEnter * :syntax sync fromstart
augroup END

set updatetime=100
set vb t_vb=
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
set autoindent
set smartcase
set smartindent
filetype indent on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
noremap <leader>1  :tabn1<cr>
noremap <leader>2  :tabn2<cr>
noremap <leader>3  :tabn3<cr>
noremap <leader>4  :tabn4<cr>
noremap <leader>5  :tabn5<cr>
noremap <leader>6  :tabn6<cr>
noremap <leader>7  :tabn7<cr>
noremap <leader>8  :tabn8<cr>
noremap <leader>9  :tabn9<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cursor
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi Cursor cterm=reverse ctermbg=22
set cursorline
hi CursorLine   cterm=NONE ctermbg=237 ctermfg=none 
hi LineNr term=underline ctermfg=249 ctermbg=235 guifg=#b0b0b0
hi CursorLineNr term=bold ctermfg=214 gui=bold guifg=Yellow
hi SyntasticErrors cterm=none ctermbg=darkred
hi QuickFixLine cterm=none ctermfg=8 ctermbg=52
hi Normal ctermfg=254 ctermbg=234 guifg=#d0d0d0 guibg=#202020
hi MatchParen ctermfg=15 ctermbg=2 gui=underline guifg=#61AFEF

hi VertSplit ctermfg=8 ctermbg=234 guifg=#e0e0e0 guibg=#000000
hi Comment ctermfg=66  


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
unmap <space>
unmap <c-space>
unmap <leader>n
" unmap <leader>p
unmap <leader>m
" map <leader>p :cp<cr>
" map <leader>n :lnext<CR>
" map <leader>m :lprevious<CR>
" map <c-n> :cnext<cr>
" map <c-m> :cprevious<cr>
map <c-n> :lnext<cr>
map <c-m> :lprevious<cr>
unmap <leader>pp
noremap <leader>c  :close<cr>
noremap oo  o<Esc>
" noremap ii  i<cr><Esc>
noremap <space><space>  i<space><Esc>
inoremap <c-f> <right>
inoremap <c-l> <right>
inoremap <c-b> <left>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-a> <home>
inoremap <c-e> <end>
inoremap <c-d> <delete>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ESC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap jk <Esc>
" inoremap <Esc> <Nop>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open new split panes to right and below
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set splitright
" set splitbelow


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn terminal to normal mode with escape
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
tnoremap <Esc> <C-\><C-n>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start terminal in insert mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufEnter * if &buftype == 'terminal' | :startinsert | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use alt+hjkl to move between split/vsplit panels
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
" nnoremap <A-h> <C-w>h
" nnoremap <A-j> <C-w>j
" nnoremap <A-k> <C-w>k
" nnoremap <A-l> <C-w>l

let g:loaded_comfortable_motion = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Insert current datetime
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=/usr/local/opt/fzf
