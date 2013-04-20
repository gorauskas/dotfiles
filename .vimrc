" File: .vimrc
" Author: Jonas Gorauskas [JGG]
" Description: Vim initialization file
" Last Modified: 2013-04-20 15:55 by jgg

set nocompatible
set backspace=indent,eol,start
set history=100
set ruler
set showcmd
set incsearch
set number
set numberwidth=5
set showmatch
set ignorecase
set tabstop=4
set shiftwidth=4
set expandtab
set directory=~/.vim/temp
set hidden
set autowriteall

if has("mouse")
    set mouse=a
endif

if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
    set cursorline
    set guifont=DejaVu\ Sans\ Mono\ 10
    winsize 100 40
    winpos 10 10
    set guioptions=ce
    set guioptions-=T
    set guioptions+=m

endif

if has("autocmd")
    filetype plugin indent on
    augroup vimrcEx
        au!
        autocmd FileType text setlocal textwidth=79
        autocmd BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") |
            \     exe "normal! g`\"" |
            \ endif
        autocmd BufReadPre *.py normal m`:%s/\s\+$//e ``
        autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
    augroup END
else
    set autoindent
endif "if has("autocmd")

set laststatus=2
set statusline=%F%m%r%h%w\ [Format:\ %{&ff}][Type:\ %Y][A:\ %03.3b,\ H:\ %02.2B][Coord:\ %04l,\ %04v][Len:\ %L][%p%%]
"              | | | | |
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- readonly flag in square brackets
"              | +-- modified flag in square brackets
"              +-- full path to file in the buffer

let g:zenburn_high_Contrast=1
colorscheme zenburn

map <F2> :NERDTreeToggle ~/<CR>
map <F3> :set invnumber<CR>
map <F7> :e ~/.vimrc<CR>

nmap <F4> :ls!<CR>:b
nmap <F5> a<C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR><Esc>

imap <F5> <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>

" using NERDTree and SnipMate
" see this http://www.catonmat.net/blog/vim-plugins-nerdtree-vim/
