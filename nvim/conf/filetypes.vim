"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shell section
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('$TMUX') 
    if has('nvim')
        set termguicolors
    else
        set term=screen-256color 
    endif
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let vim_markdown_folding_disabled = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mini program
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.acss set syntax=css ft=css
au BufNewFile,BufRead *.axml set syntax=html ft=html
au BufNewFile,BufRead *.wxss set syntax=css ft=css
au BufNewFile,BufRead *.wxml set syntax=html ft=html
