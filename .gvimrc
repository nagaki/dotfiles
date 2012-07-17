set nocompatible

if has('kaoriya')
  set transparency=10
  set background=dark
  set lines=40 columns=120
  set scrolloff=999
  set guifont=inconsolata:h15
  set guioptions-=T
  set whichwrap=b,s,h,s,<,>,[,]
  colorscheme desert
endif

if has('gui_running')
  set fuoptions=maxvert, maxhorz
  au GUIEnter * set fullscreen
endif

