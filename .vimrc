set nocompatible

filetype off
filetype plugin indent off

"NeoBundle用の設定
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

"ステータスライン
NeoBundle 'Lokaltog/vim-powerline'

"ファイラ〜
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'

"補完
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'

"コーディング
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'AutoClose'
NeoBundle 'surround.vim'

"カラースキーム
NeoBundle 'molokai'
NeoBundle 'altercation/vim-colors-solarized'

"Ruby on Rails開発
NeoBundle 'taichouchou2/vim-rails'
NeoBundle 'romanvbabenko/rails.vim'
NeoBundle 'tpope/vim-endwise.git'
NeoBundle 'thinca/vim-quickrun'

"デバッグ
"NeoBundle 'joonty/vim-xdebug'

"シンタックスチェック
NeoBundle 'scrooloose/syntastic'

"Github
NeoBundle 'tpope/vim-fugitive'

filetype plugin indent on

"neocomplcache補完の設定
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1

"シンタックスチェック

"HTMLとPHPの閉じタグの自動入力
augroup MyXML
  autocmd!
  autocmd Filetype html,xml inoremap <buffer> </ </<C-x><C-o>
augroup END

"前回終了したカーソル行に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

".tplのファイルを.htmlとして扱う
autocmd BufRead,BufNewFile *.tpl set filetype=html

"WordPress用の関数辞書の場所を設定
autocmd FileType php :set dictionary=~/.vim/dict/wordpress.dict

"オプション設定
set ambiwidth=double
set autoindent
set backspace=indent,eol,start
set cursorline
set encoding=utf-8
set expandtab
set number
set laststatus=2
set list
set listchars=tab:^_
set nobackup
set noswapfile
set nowrap
set scrolloff=999
set shiftwidth=2
set smartcase
set smartindent
set softtabstop=0
set splitbelow
set splitright
set title
set tabstop=2
set whichwrap=b,s,h,s,<,>,[,]

"マウスを使用できるようにする
if has('mouse')
  set mouse=a
endif

"シンタックス有効
syntax enable

"保存時に行末のスペースを削除
autocmd BufWritePre * :%s/\s\+$//ge

"保存時にタブをスペースに変換
autocmd BufWritePre * ;%s/\t/  /ge

"カラースキーマ設定
colorscheme molokai

"PowerLineの設定
let g:Powerline_symbols = 'fancy'

"vimコマンド時、;:をshiftなしで:に統一する
noremap ; :

"Ctrl+fでVimFilerを開く
nnoremap <C-F> :VimFiler -buffer-name=explorer -split -winwidth=30 -toggle -no-quit<CR>

"RSenseの設定
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:rsenseUseOmniFunc = 1
if filereadable(expand('/usr/local/Cellar/rsense/0.3/libexec/bin/rsense'))
  let g:rsenseHome = expand('/usr/local/Cellar/rsense/0.3/libexec')
  let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
endif

"quickrun.vimを横分割で開く
let g:quickrun_config={'*': {'split': ''}}
