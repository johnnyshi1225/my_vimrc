" line
set number
set history=1000
set background=dark

" syntax highlight
syntax on
filetype plugin indent on

" indent
set autoindent
set smartindent
set cindent

"tab & expand
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab

" brackets match
set showmatch

" cursor position
set  ruler

" highlight current line
set cursorline

" quick search
set incsearch
set hlsearch
set ignorecase smartcase

" fold
set foldmethod=indent

" mouse
set mouse=c

" comment for vim setting
set modeline

"colorscheme evening

" pathogen
call pathogen#infect()

" powerline {
" set guifont=PowerlineSymbols\ for\ Powerline
" set nocompatible
" set t_Co=256
" let g:Powerline_symbols = 'fancy'
" set laststatus=2
" }

" chinese
"set enc=utf-8
"set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"set langmenu=zh_CN.UTF-8
"language message zh_CN.UTF-8
"set guifont=NSimSun:h8
"set helplang=cn
"set ambiwidth=double

" window
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

" <F1> compile
map <F1> :call CompileRun()<CR>
func! CompileRun()
    if &filetype == 'python'
        exec ":w"
        exec "!/usr/local/bin/python ./%"
    elseif &filetype == 'c'
        exec ":w" 
        exec "!gcc % -o %<"
        exec "! ./%<"
	elseif &filetype == 'go'
        exec ":w"
        exec "!go run ./%"
    endif
endfunc

"**********************************************************

"新建文件后，自动定位到文件末尾
"autocmd BufNewFile * normal G

"autocmd BufNewFile *.sh,*.java,*.py,*.go exec ":call SetTitle()"
"定义函数SetTitle，自动插入文件头
func SetTitle()
	"如果文件类型为.sh文件
	if &filetype == 'sh'
		call setline(1, "\#########################################################################")
		call append(1, "\# Author: Johnny Shi")
		call append(2, "\# Created Time: ".strftime("%Y-%m-%d %H:%M:%S"))
		call append(3, "\# File Name: ".expand("%"))
		call append(4, "\# Description: ")
		call append(5, "\#########################################################################")
		call append(6, "\#!/bin/bash")
		call append(7, "")
	elseif &filetype == 'python'
		call setline(1, "\#########################################################################")
		call append(1, "\# Author: Johnny Shi")
		call append(2, "\# Created Time: ".strftime("%Y-%m-%d %H:%M:%S"))
		call append(3, "\# File Name: ".expand("%"))
		call append(4, "\# Description: ")
		call append(5, "\#########################################################################")
		call append(6, "\#!/usr/bin/env python")
		call append(7, "\#-*- coding: utf-8 -*-")
		call append(8, "")
		call append(9, "\# vim: set noexpandtab ts=4 sts=4 sw=4 :")
	elseif &filetype == 'go'
		call setline(1, "\//#########################################################################")
		call append(1, "\// Author: Johnny Shi")
		call append(2, "\// Created Time: ".strftime("%Y-%m-%d %H:%M:%S"))
		call append(3, "\// File Name: ".expand("%"))
		call append(4, "\// Description: ")
		call append(5, "\//#########################################################################")
		call append(6, "")
		call append(7, "\// vim: set noexpandtab ts=4 sts=4 sw=4 :")
	endif
endfunc

"**********************************************************

" NERDTree config
" <F2> NERDTree
map <F2> :call NERDTree()<CR>
func! NERDTree()
	exec ":NERDTreeToggle"
endfunc
" open a NERDTree automatically when vim starts up
"autocmd vimenter * NERDTree
" open a NERDTree automatically when vim starts up if no files were specified
"autocmd vimenter * if !argc() | NERDTree | endif

" vim中命令行模式的自动匹配
set wildmode=longest:list

