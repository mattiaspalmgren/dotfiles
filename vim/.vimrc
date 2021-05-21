"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set number
set autoindent
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=2
set noswapfile
set updatetime=100
set linespace=10
set hlsearch
set clipboard+=unnamedplus

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEYS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader="\<Space>"
nmap <leader>1 :NERDTreeToggle<CR>
nmap <silent> <leader>v :NERDTreeFind<CR>
nmap <leader>q :q<CR>
nmap <leader>w :w<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLORS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable
highlight LineNr ctermfg=Grey

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.local/share/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --no-bash' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'itchyny/lightline.vim'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" NERDTREE
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1

"" LIGHTLINE
set laststatus=2
set noshowmode

"" SEARCH
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
