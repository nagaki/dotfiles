# autojumpの設定
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# 補完
autoload -U compinit; compinit

# エディタ設定
export EDITOR=vim

# 文字コード設定
export LANG=ja_JP.UTF-8
export KCODE=u

# キーバインドをvimに設定
bindkey -v

# プロンプトの色設定
autoload -U colors; colors

## 履歴の設定

# 保存先ファイル
HISTFILE="$HOME/.zsh_history"
# 件数
HISTSIZE=100000
SAVEHIST=100000
# 重複を保存しない
setopt hist_ignore_dups
# 共有
setopt share_history

# ディレクトリ名のみで移動可能
setopt auto_cd

# カラースキーム
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=36:ln=35:so=32:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export CLICOLOR=true
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# エイリアス
alias la='ls -a'
alias ll='ls -al'

# ビープ音を鳴らさない
setopt nobeep

# 右プロンプトの表示
RPROMPT="[%~]"
