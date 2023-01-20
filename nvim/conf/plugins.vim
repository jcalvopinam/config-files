"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto-install vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

let g:python3_host_prog='/usr/bin/python3'

call plug#begin('~/.config/nvim/autoload/plugged')
    
    " general
    Plug 'sheerun/vim-polyglot'
    Plug 'machakann/vim-highlightedyank'
    Plug 'elzr/vim-json'
    Plug 'plasticboy/vim-markdown'
    Plug 'jiangmiao/auto-pairs'

    " navigation
    Plug 'scrooloose/nerdtree'
    Plug 'vim-scripts/mru.vim'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tacahiroy/ctrlp-funky'
    Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
    Plug 'jlanzarotta/bufexplorer'
    Plug 'Asheq/close-buffers.vim'
    Plug 'dense-analysis/ale'
    Plug 'itchyny/lightline.vim'

    " ranger
    Plug 'rbgrouleff/bclose.vim'
    Plug 'francoiscabrol/ranger.vim'

    " edit
    Plug 'easymotion/vim-easymotion'
    Plug 'junegunn/vim-easy-align'
    Plug 'tpope/vim-surround'
    Plug 'jiangmiao/auto-pairs'
    Plug 'ollykel/v-vim'
    Plug 'AndrewRadev/splitjoin.vim'
    Plug 'terryma/vim-expand-region'
    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'michaeljsmith/vim-indent-object'
    
    " scheme
    Plug 'sonph/onehalf', { 'rtp': 'vim' }

call plug#end()
