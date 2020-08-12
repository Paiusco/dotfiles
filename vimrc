" paiusco vimrc file
" Based from awidegreen 
" https://github.com/awidegreen/dotfiles

call plug#begin('~/vim//plugged')      "Start for vim-plug

Plug 'rafi/awesome-vim-colorschemes'   " Tons of colourschemes
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' "Code Snippets
Plug 'preservim/nerdtree'              " Help with exploring files
Plug 'itchyny/lightline.vim'           " Minimalist powerline (vim-airline seems overkill)
Plug 'vim-utils/vim-man'               " Vim for MAN pages
Plug 'sheerun/vim-polyglot'            " Identation and syntax for tons of languages
Plug 'dag/vim-fish'                    " Syntax for the best shell ever :)

call plug#end() "End for vim-plug

" This must be first
if &compatible
   " `:set nocompatible` has many side effects. Therefore this should be done
   " only when 'compatible' is set.
   set nocp
endif

" Look & feel {
colorscheme gruvbox
set background=dark
let g:lightline = {
      \ 'colorscheme': 'gruvbox'
      \ }

set list
set listchars=tab:▸\ ,eol:¬ 

set t_Co=256         " Supporting 256 colours

set colorcolumn=81   " Ruler at 81 chars
" highlight ColorColumn ctermbg=156  " How to force color to red?

set cursorline       " Highlight the current line under cursor
set laststatus=2     " Useful to show better powerline
syntax on
" }


" VIM Behaviour {

set noshowmode       " *Don't* show what mode you're currently editing in
                     " (because lightline will do that for you)
set nowrap           " Don't wrap lines
set tabstop=3        " Tab in spaces
set softtabstop=3    " When hitting <BS>, pretend like a tab is removed,
                     " even if spaces
set expandtab        " Change tab for spaces
set smartcase        " Case insentive search unless there's a capital letter
set shiftwidth=3     " Multiple of shiftwidth when indenting with '<' and '>'
set number           " Show line numbers
set relativenumber   " Show relative line numbering
set showmatch        " Show matching parenthesis
set scrolloff=3      " Keep 3 lines off the edges of the screen when scrolling
set virtualedit=all  " Allow the cursor to go into 'invalid' places
set hlsearch         " Highlight seach terms
set incsearch        " Highlight search while typing
set ttyfast          " Have a fast tty
set mouse=a          " Enable using the mouse if terminal emulator supports it
set noswapfile       " No annoying swap file
" }


filetype plugin indent on
" Plugs that I think one should take a look into later:
" Plug 'scrooloose/nerdtree'
" Plug 'tpope/vim-commentary'   " toggle comments
" FZF should be added together
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
"
" Plug 'vuciv/vim-bujo'     " TODO list
" Plug 'tpope/vim-fugitive' " Git thingy
" Plug 'ctrlpvim/ctrlp.vim' " Ctrl+p to find files. Isn't fzf gonna cover
" that?
"
"
" Another neat .vimrc to learn from
" https://github.com/erkrnt/awesome-streamerrc/blob/master/ThePrimeagen/init.vim
