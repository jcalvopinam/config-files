![Neovim](https://raw.githubusercontent.com/neovim/neovim.github.io/master/logos/neovim-logo-300x87.png)

# The auto-neovim configuration
This configuration was taken as reference from [venjiang/nvimrc](https://github.com/venjiang/nvimrc)

thanks:
* [amix/vimrc](https://github.com/amix/vimrc) 

## Prerequisites

* [Neovim](https://neovim.io/)
`brew install nvim`


## Installation

The version includes a lot of great plugins, configurations and color schemes that make Neovim a lot better. To install it simply do following from your terminal:

```shell
mkdir -p ~/space
git clone --depth=1 https://github.com/jcalvopinam/config-files.git ~/space/config-files/
sh ~/space/config-files/nvim/install.sh
```

Done! Just run `nvim`, have fun!!! 😄


## Screenshots

Colors when editing a basic.vim:

![Screenshot 1](https://github.com/venjiang/nvimrc/blob/master/screenshots/basic.png?raw=true)

## Included Plugins

I recommend reading the docs of these plugins to understand them better. Each plugin provides a much better Neovim experience!

* [bufexplorer.zip](https://github.com/vim-scripts/bufexplorer.zip): Quickly and easily switch between buffers. This plugin can be opened with `<leader+o>`
* [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim): Fuzzy file, buffer, mru and tag finder. It's mapped to `<Ctrl+F>`
* [goyo.vim](https://github.com/junegunn/goyo.vim): 
* [lightline.vim](https://github.com/itchyny/lightline.vim): A light and configurable statusline/tabline for Vim
* [NERD Tree](https://github.com/scrooloose/nerdtree): A tree explorer plugin for vim
* [mru.vim](https://github.com/vim-scripts/mru.vim): Plugin to manage Most Recently Used (MRU) files. This plugin can be opened with `<leader+f>`
* [open_file_under_cursor.vim](https://github.com/amix/open_file_under_cursor.vim): Open file under cursor when pressing `gf`
* [snipmate.vim](https://github.com/garbas/vim-snipmate): snipmate.vim aims to be a concise vim script that implements some of TextMate's snippets features in Vim
* [ale](https://github.com/w0rp/ale): Syntax and lint checking for vim (ALE requires NeoVim >= 0.2.0 or Vim 8 with +timers +job +channel)
the target of a motion. `gcu` uncomments a set of adjacent commented lines.
* [vim-expand-region](https://github.com/terryma/vim-expand-region): Allows you to visually select increasingly larger regions of text using the same key combination
* [vim-indent-object](https://github.com/michaeljsmith/vim-indent-object): Defines a new text object representing lines of code at the same indent level. Useful for python/vim scripts


## Included color schemes
* [onehalf](https://github.com/sonph/onehalf)


## Key Mappings
The [leader](http://learnvimscriptthehardway.stevelosh.com/chapters/06.html#leader) is `,`, so whenever you see `<leader>` it means `,`.


### Normal mode mappings
Fast saving of a buffer (`<leader>w`):

    nmap <leader>w :w!<cr>

Map `<Space>` to `/` (search) and `<Ctrl>+<Space>` to `?` (backwards search):
    map <space> /
    map <C-space> ?
    map <silent> <leader><cr> :noh<cr>

Disable highlights when you press `<leader><cr>`:
    map <silent> <leader><cr> :noh<cr>

Smart way to move between windows (`<ctrl>j` etc.):
    map <C-j> <C-W>j
    map <C-k> <C-W>k
    map <C-h> <C-W>h
    map <C-l> <C-W>l

Closing of the current buffer(s) (`<leader>bd` and (`<leader>ba`)):
    " Close current buffer
    map <leader>bd :Bclose<cr>
    
    " Close all buffers
    map <leader>ba :1,1000 bd!<cr>

Useful mappings for managing tabs:
    map <leader>tn :tabnew<cr>
    map <leader>to :tabonly<cr>
    map <leader>tc :tabclose<cr>
    map <leader>tm :tabmove 
    
    " Opens a new tab with the current buffer's path
    " Super useful when editing files in the same directory
    map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

Switch [CWD](http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file) to the directory of the open buffer:
    map <leader>cd :cd %:p:h<cr>:pwd<cr>

Open `ack.vim` for fast search:
    map <leader>g :Ack 

Quickly open a buffer for scripbble:
    map <leader>q :e ~/buffer<cr>

Toggle paste mode on and off:
    map <leader>pp :setlocal paste!<cr>


### Visual mode mappings

Visual mode pressing `*` or `#` searches for the current selection:

    vnoremap <silent> * :call VisualSelection('f')<CR>
    vnoremap <silent> # :call VisualSelection('b')<CR>

When you press gv you `Ack.vim` after the selected text:

    vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

When you press `<leader>r` you can search and replace the selected text:

    vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

Surround the visual selection in parenthesis/brackets/etc.:

    vnoremap $1 <esc>`>a)<esc>`<i(<esc>
    vnoremap $2 <esc>`>a]<esc>`<i[<esc>
    vnoremap $3 <esc>`>a}<esc>`<i{<esc>
    vnoremap $$ <esc>`>a"<esc>`<i"<esc>
    vnoremap $q <esc>`>a'<esc>`<i'<esc>
    vnoremap $e <esc>`>a"<esc>`<i"<esc>


### Insert mode mappings

Quickly insert parenthesis/brackets/etc.:

    inoremap $1 ()<esc>i
    inoremap $2 []<esc>i
    inoremap $3 {}<esc>i
    inoremap $4 {<esc>o}<esc>O
    inoremap $q ''<esc>i
    inoremap $e ""<esc>i
    inoremap $t <><esc>i

Insert the current date and time (useful for timestamps):

    iab xdate <C-r>=strftime("%d/%m/%y %H:%M:%S")<cr>


### Command line mappings

$q is super useful when browsing on the command line. It deletes everything until the last slash:

    cno $q <C-\>eDeleteTillSlash()<cr>

Bash like keys for the command line:

    cnoremap <C-A>        <Home>
    cnoremap <C-E>        <End>
    cnoremap <C-K>        <C-U>

    cnoremap <C-P> <Up>
    cnoremap <C-N> <Down>

Write the file as sudo (works only on Unix). Super useful when you open a file and you don't have permissions to save your changes. [Vim tip](http://vim.wikia.com/wiki/Su-write):

    :W 


### Plugin related mappings

Open [bufexplorer](https://github.com/vim-scripts/bufexplorer.zip) to see and manage the current buffers (`<leader>o`):
    map <leader>o :BufExplorer<cr>

Open [MRU.vim](https://github.com/vim-scripts/mru.vim) to see the recently open files (`<leader>f`):

    map <leader>f :MRU<CR>

Open [ctrlp.vim](https://github.com/kien/ctrlp.vim) plugin to quickly find a file or a buffer (`<leader>j` or `<ctrl>f`):
    let g:ctrlp_map = '<C-f>'

[NERD Tree](https://github.com/scrooloose/nerdtree) mappings:

    map <leader>nn :NERDTreeToggle<cr>
    map <leader>nb :NERDTreeFromBookmark 
    map <leader>nf :NERDTreeFind<cr>

[ctrl-p](https://github.com/ctrlpvim/ctrlp.vim) mappings to easily find and open a file, buffer, etc.:

    let g:ctrlp_map = '<C-f>'
    map <leader>j :CtrlP<cr>
    map <C-b> :CtrlPBuffer<cr>

[vim-snipmate](https://github.com/garbas/vim-snipmate) mappings to autocomplete via snippets:

    ino <C-j> <C-r>=snipMate#TriggerSnippet()<cr>
    snor <C-j> <esc>i<right><C-r>=snipMate#TriggerSnippet()<cr>

[vim-surround](https://github.com/tpope/vim-surround) mappings to easily surround a string with `_()` gettext annotation:

    vmap Si S(i_<esc>f)
    au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>

[ale](https://github.com/dense-analysis/ale) to easily go to the next Ale syntax/lint error:

    nmap <silent> <leader>a <Plug>(ale_next_wrap)


### Spell checking
Pressing `<leader>ss` will toggle spell checking:

```shell
map <leader>ss :setlocal spell!<cr>
```

Shortcuts using `<leader>` instead of special characters:

```shell
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
```
