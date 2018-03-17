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

" use osx clipboard
set clipboard+=unnamed
" make backspace work like most other programs
set backspace=2
" disable folding
set nofoldenable
" for lightline
set laststatus=2
set noshowmode

set number
highlight LineNr ctermfg=Grey

nnoremap ' `
nnoremap ` '

" Colors {{{
syntax enable
" }}}
