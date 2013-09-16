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

" chinese
"set enc=utf-8
"set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"set langmenu=zh_CN.UTF-8
"language message zh_CN.UTF-8
"set guifont=NSimSun:h8
"set helplang=cn
"set ambiwidth=double

"window
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
        exec "w" 
        exec "!gcc % -o %<"
        exec "! ./%<"
    endif
endfunc

" <F2> NERDTree
map <F2> :call NERDTree()<CR>
func! NERDTree()
	exec ":NERDTreeToggle"
endfunc
