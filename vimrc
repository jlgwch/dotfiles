"---------------general-------------
set nocompatible
set encoding=UTF-8
filetype on
filetype plugin indent on
set spell
set mouse=a
set number
" set cursorline
" set cursorcolumn
set showcmd
set showmatch
set nowrap
set nobackup
set wildmenu
set history=1000
set tabstop=4 shiftwidth=4 expandtab smarttab
set autoindent smartindent cindent
set hlsearch incsearch ignorecase smartcase
syntax enable
set list
set listchars=tab:>-,trail:-
set ttimeoutlen=0
set autoread
au FocusGained,BufEnter * silent! checktime