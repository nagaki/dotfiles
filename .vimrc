set nocompatible

filetype off
filetype plugin indent off

"NeoBundle用の設定
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

"ファイラ〜
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'

"補完
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplcache-snippets-complete'

"コーディング
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'AutoClose'
NeoBundle 'surround.vim'

"カラースキーム
NeoBundle 'fugalh/desert.vim'

"Ruby on Rails開発
NeoBundle 'taichouchou2/vim-rails'
NeoBundle 'romanvbabenko/rails.vim'
NeoBundle 'tpope/vim-endwise.git'
NeoBundle 'thinca/vim-quickrun'

"デバッグ
NeoBundle 'joonty/vim-xdebug'

filetype plugin indent on

"neocomplcache補完の設定
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1

"HTMLとPHPの閉じタグの自動入力
augroup MyXML
  autocmd!
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype php inoremap <buffer> </ </<C-x><C-o>
augroup END

".tplのファイルを.htmlとして扱う
autocmd BufRead,BufNewFile *.tpl set filetype=html

"基本設定
set encoding=utf-8
set cursorline
set number
set title
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
set backspace=indent,eol,start
set whichwrap=b,s,h,s,<,>,[,]
set splitbelow
set splitright
set ambiwidth=double

"マウスを使用できるようにする
if has('mouse')
  set mouse=a
endif

"保存時に行末のスペースを削除
autocmd BufWritePre * :%s/\s\+$//ge

"保存時にタブをスペースに変換
autocmd BufWritePre * ;%s/\t/  /ge

"カラースキーマ設定
colorscheme desert

"シンタックス有効
syntax enable

"vimコマンド時、;:をshiftなしで:に統一する
noremap ; :

"Ctrl+fでVimFilerを開く
nnoremap <C-F> :VimFiler -buffer-name=explorer -split -winwidth=40 -toggle -no-quit<CR>

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

"ステータスラインのカラー設定（モード変更時）
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
