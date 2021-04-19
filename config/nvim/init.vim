" paiusco vimrc file
" Based from awidegreen
" https://github.com/awidegreen/dotfiles

call plug#begin('~/vim//plugged')      " Start for vim-plug

Plug 'rafi/awesome-vim-colorschemes'   " Tons of colourschemes
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' " Code Snippets
Plug 'preservim/nerdtree'              " Help with exploring files
Plug 'itchyny/lightline.vim'           " Minimalist powerline (vim-airline seems overkill)
Plug 'sheerun/vim-polyglot'            " Identation and syntax for tons of languages
Plug 'ntpeters/vim-better-whitespace'" Shows and trims whitespaces
call plug#end() " End for vim-plug

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

" set cursorline       " Highlight the current line under cursor
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
set hlsearch         " Highlight seach terms (default on nvim)
set incsearch        " Highlight search while typing (default on nvim)
set ttyfast          " Have a fast tty  (default on nvim)
set mouse=a          " Enable using the mouse if terminal emulator supports it
set noswapfile       " No annoying swap file
set clipboard+=unnamedplus " Merge both system clipboard and vim's
" }

" Plugin settings, mappings and autocommands {

" Define leader key
let mapleader = " "

" Opens the .vimrc in a vertical splitt
noremap <leader>ev :vsplit $MYVIMRC<cr>

" 'source my vimrc'
nnoremap <leader>sv :source $MYVIMRC<cr>

" Get rid of search highlights
nnoremap <leader><space> :noh<cr>

" Copy to system's clipboard
nnoremap <leader>y "*y<cr>

" Paste fro system's clipboard
nnoremap <leader>p "*p<cr>

" Exist insert mode with çç
inoremap çç <esc>

" Save file from insert mode
inoremap çw <esc>:w<cr>

" Save file from normal mode
nnoremap çw <esc>:w<cr>

" toggle NERDtree with F3
nnoremap <F3> :NERDTreeToggle<CR>

" ntpeters/vim-better-whitespace
" ------------------------------------------------------------------------------
let g:better_whitespace_enabled=1 " Enables highlighting
let g:strip_whitespace_confirm=0  " Remove the confirmation every time its saves
let g:strip_whitespace_on_save=1  " Trim the whitespaces on save
" let g:strip_only_modified_lines=1 " Trims only on modified lines

" }

filetype plugin indent on
" Plugs that I think one should take a look into later:
" Plug 'tpope/vim-commentary'   " toggle comments
" FZF should be added together
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
"
" Plug 'vuciv/vim-bujo'     " TODO list
" Plug 'tpope/vim-fugitive' " Git thingy
" Plug 'ctrlpvim/ctrlp.vim' " Ctrl+p to find files. Isn't fzf gonna cover
" that?
" Plugin 'jiangmiao/auto-pairs'
"
" Automatically clear search highlights after you move your cursor.
" Plug 'haya14busa/is.vim'
"
" Automatically show Vim's complete menu while typing.
" Plug 'vim-scripts/AutoComplPop'
"
"
" Another neat .vimrc to learn from
" https://github.com/erkrnt/awesome-streamerrc/blob/master/ThePrimeagen/init.vim
