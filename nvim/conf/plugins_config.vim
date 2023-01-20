
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" bufExplorer plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MRU plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YankStack
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:yankstack_yank_keys = ['y', 'd']

nmap <C-p> <Plug>yankstack_substitute_older_paste
nmap <C-n> <Plug>yankstack_substitute_newer_paste


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" snipMate (beside <TAB> support <CTRL-j>)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
ino <C-j> <C-r>=snipMate#TriggerSnippet()<cr>
snor <C-j> <esc>i<right><C-r>=snipMate#TriggerSnippet()<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>
map <leader>ff :NERDTreeFind<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-s>'
let g:multi_cursor_select_all_word_key = '<A-s>'
let g:multi_cursor_start_key           = 'g<C-s>'
let g:multi_cursor_select_all_key      = 'g<A-s>'
let g:multi_cursor_next_key            = '<C-s>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" surround.vim config
" Annotate strings with gettext 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
\ 'colorscheme': 'wombat',
\ 'active': {
\   'left': [ ['mode', 'paste'],
\             ['fugitive', 'readonly', 'filename', 'modified'] ],
\   'right': [ [ 'lineinfo' ], ['percent'] ]
\ },
\ 'component': {
\   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
\   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
\   'fugitive': '%{exists("*FugitiveHead")?FugitiveHead():""}'
\ },
\ 'component_visible_condition': {
\   'readonly': '(&filetype!="help"&& &readonly)',
\   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
\   'fugitive': '(exists("*FugitiveHead") && ""!=FugitiveHead())'
\ },
\ 'separator': { 'left': ' ', 'right': ' ' },
\ 'subseparator': { 'left': ' ', 'right': ' ' }
\ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ale (syntax checker and linter)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
\   'javascript': ['jshint'],
\   'python': ['flake8'],
\   'java': ['java']
\}

nmap <silent> <leader>a <Plug>(ale_next_wrap)

" Disabling highlighting
let g:ale_set_highlights = 0

" Only run linting when saving the file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree-git-plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeShowIgnoredStatus = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp-funky 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
" unmap <leader>j 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-easymotion 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_smartcase = 1

" keep cursor column when JK motion
" let g:EasyMotion_startofline = 0

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>w <Plug>(easymotion-w)
map <Leader>b <Plug>(easymotion-b)
map <Leader>. <Plug>(easymotion-repeat)
nmap f <Plug>(easymotion-bd-fl)
" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Bidirectional & within line 't' motion
nmap t <Plug>(easymotion-bd-tl)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-easy-align
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start interactive EasyAlign in visual mode (vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (gaip)
nmap ga <Plug>(EasyAlign)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indentLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_color_gui = '#ea4c88'
let g:indentLine_char = '⏽ '
let g:indentLine_setConceal = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JavaScript settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ranger settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The shortcut for opening Ranger is <leader>f (\f by default) 
" To disable the default key mapping
let g:ranger_map_keys = 0
map <leader>r :Ranger<CR>
