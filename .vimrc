set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'itchyny/lightline.vim'

call vundle#end()
filetype plugin indent on

set clipboard+=unnamed 	" use osx clipboard
set backspace=2 	" make backspace work like most other programs
set laststatus=2 	" for lightline
set noshowmode 		" for lightline
set nofoldenable
set number
set incsearch
set timeoutlen=1000 ttimeoutlen=0 " remove delay when leaving insert mode

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

highlight LineNr ctermfg=Grey

let mapleader=" "
nnoremap ' `
nnoremap ` '
nnoremap <leader>w :update<cr>
nnoremap <leader>q :q<cr>


" Colors {{{
syntax enable
" }}}
