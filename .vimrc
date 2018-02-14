set nocompatible " be iMproved, required
filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Bundles here:
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

call vundle#end()            " required
filetype plugin indent on    " required

" use osx clipboard
set clipboard+=unnamed
" make backspace work like most other programs
set backspace=2
" disable folding
set nofoldenable

nnoremap ' `
nnoremap ` '

" Colors {{{
syntax enable
" }}}
