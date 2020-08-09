" paiusco vimrc file
" Based from awidegreen 
" https://github.com/awidegreen/dotfiles

" This must be first
if &compatible
   " `:set nocompatible` has many side effects. Therefore this should be done
   " only when 'compatible' is set.
   set nocp
endif

" Look & feel {
colorscheme wombat
let g:rehash256=1 "?

set list
set listchars=tab:▸\ ,eol:¬ 

set t_Co=256         " Supporting 256 colours

set colorcolumn=81   " Ruler at 81 chars
highlight ColorColumn ctermbg=8

set cursorline       " Highlight the current line under cursor
syntax on
" }


" VIM Behaviour {

set showmode         " Always show what mode you're currently editing in
set nowrap           " Don't wrap lines
set tabstop=3        " Tab in spaces
set softtabstop=3    " When hitting <BS>, pretend like a tab is removed,
                     " even if spaces
set expandtab        " Change tab for spaces
set shiftwidth=3     " Multiple of shiftwidth when indenting with '<' and '>'
set number           " Show line numbers
set showmatch        " Show matching parenthesis
set scrolloff=3      " Keep 3 lines off the edges of the screen when scrolling
set virtualedit=all  " Allow the cursor to go into 'invalid' places
set hlsearch         " Highlight seach terms
set ttyfast          " Have a fast tty
set mouse=a          " Enable using the mouse if terminal emulator supports it

" }

filetype plugin indent on
