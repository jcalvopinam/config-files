" Based on https://gist.github.com/meskarune/57b613907ebd1df67eb7bdb83c6e6641
" Status bar colors
au InsertEnter * hi statusline   guifg=black     guibg=#d7afff   gui=none   ctermfg=black   ctermbg=magenta
au InsertLeave * hi statusline   guifg=black     guibg=#8fbfdc   gui=none   ctermfg=black   ctermbg=cyan
hi MyStatusline                  guifg=#ea4c88   guibg=#303030   gui=none   ctermfg=196     ctermbg=none
hi MyStatuslineDetail            guifg=#262626   guibg=#ea4c88   gui=none   ctermfg=000     ctermbg=196

" Status Line Custom
let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'Normal·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '^V' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}

function! RedrawModeColors(mode) " {{{
  " Normal mode
  if a:mode == 'n'
    hi MyStatuslineColor        guifg=#ea4c88   guibg=#303030   gui=none  ctermfg=196   ctermbg=none
    hi MyStatuslineFilepath     guifg=#262626   guibg=#ea4c88   gui=none  ctermfg=000   ctermbg=196
    hi MyStatuslineIcon         guibg=#ea4c88   guifg=#262626   gui=none  ctermfg=000   ctermbg=196

  " Insert mode
  elseif a:mode == 'i'
    hi MyStatuslineColor        guifg=#ea4c88   guibg=none      gui=none
    hi MyStatuslineFilepath     guifg=#302d38   guibg=#ea4c88   gui=none
    hi MyStatuslineIcon         guibg=#ea4c88   guifg=#66f2f2   gui=none   ctermfg=110   ctermbg=196

  " Replace mode
  elseif a:mode == 'R'
    hi MyStatuslineColor        guifg=#ea4c88   guibg=none      gui=none
    hi MyStatuslineFilepath     guifg=#000000   guibg=#ea4c88   gui=none
    hi MyStatuslineIcon         guibg=#ea4c88   guifg=#000000   gui=none

  " Visual mode
  elseif a:mode == 'v' || a:mode == 'V' || a:mode == '^V'
    hi MyStatuslineColor        guifg=#ea4c88   guibg=none      gui=none
    hi MyStatuslineFilepath     guifg=#000000   guibg=#ea4c88   gui=none
    hi MyStatuslineIcon         guibg=#000000   guifg=#ea4c88   gui=none
  endif

  return ''
endfunction
" }}}

set statusline=%{RedrawModeColors(mode())}

" Left side items
set statusline+=%#MyStatuslineColor#
set statusline+=%#MyStatuslineIcon# 

" Filename
set statusline+=%#MyStatuslineFilepath#\ %F
set statusline+=%#MyStatuslineColor#\ 

" Git Status
"set statusline+=%=

" Details
set statusline+=%=                                                            " Right Side
set statusline+=%#MyStatusline#                                             " Left semicircle white
set statusline+=%#MyStatuslineDetail#%1*│                                     " Separator
set statusline+=%#MyStatuslineDetail#%0*\ %Y\                                 " FileType
set statusline+=%#MyStatuslineDetail#%1*│                                     " Separator
set statusline+=%#MyStatuslineDetail#%0*\ %{''.(&fenc!=''?&fenc:&enc).''}     " Encoding
set statusline+=%#MyStatuslineDetail#%0*\ (%{&ff})\                           " FileFormat (dos/unix)
set statusline+=%#MyStatuslineDetail#%1*│                                     " Separator
set statusline+=%#MyStatuslineDetail#%0*\ \%02l\:                             " Line number
set statusline+=%#MyStatuslineDetail#%0*\%02v                                 " Column number
set statusline+=%#MyStatuslineDetail#%0*\ (%L)\                               " Total lines
set statusline+=%#MyStatuslineDetail#%1*│                                     " Separator
set statusline+=%#MyStatuslineDetail#%0*\ %4p%%\                              " percentage of document
set statusline+=%#MyStatuslineDetail#%1*│                                     " Separator
set statusline+=%#MyStatuslineDetail#%0*\ %{toupper(g:currentmode[mode()])}\  " The current mode
set statusline+=%#MyStatuslineDetail#%1*│                                     " Separator
set statusline+=%#MyStatusline#                                             " Right semicircle white
