set nocompatible

filetype off
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplcache-snippets-complete'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'fugalh/desert.vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'joonty/vim-xdebug'

filetype plugin indent on

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1

augroup MyXML
  autocmd!
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype php inoremap <buffer> </ </<C-x><C-o>
augroup END

au BufRead,BufNewFile *.tpl set filetype=html

set encoding=utf-8
set cursorline
set number
set title
"set lines=40 columns=120
set scrolloff=999

set tabstop=2
set shiftwidth=2
set softtabstop=0
set autoindent
set expandtab
set smartcase
set nowrap
set nobackup
set noswapfile

set list
set listchars=tab:^_

"backspace enable
set backspace=indent,eol,start

set whichwrap=b,s,h,s,<,>,[,]

if has('mouse')
  set mouse=a
endif

autocmd BufWritePre * :%s/\s\+$//ge
autocmd BufWritePre * ;%s/\t/ /ge

syntax enable
colorscheme desert
