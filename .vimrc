set nocompatible
filetype off
filetype plugin indent off

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
	call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'

filetype plugin indent on
