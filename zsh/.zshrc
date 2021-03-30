
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f" || \
        print -P "%F{160}▓▒░ The clone has failed.%f"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit installer's chunk


# ----------------------------
# user setting
# ----------------------------
: "Utility" && {
	autoload -Uz colors ; colors
	autoload -U compinit && compinit # 補完機能の強化
	setopt correct # 入力しているコマンド名が間違っている場合にもしかして：を出す。
	setopt no_beep
	setopt no_tify # バックグラウンドジョブが終了したらすぐに知らせる。
	unsetopt auto_menu
	setopt auto_pushd # cd -[tab]で過去のディレクトリにひとっ飛びできるようにする
	setopt auto_cd
	setopt interactive_comments
}

setopt extended_glob
setopt auto_param_slash
setopt mark_dirs
setopt no_clobber
setopt list_types
setopt auto_param_keys
setopt noautoremoveslash

: "history" && {
	HISTFILE=$HOME/.zsh_history
	HISTSIZE=10000
	SAVEHIST=10000
	LISTMAX=1000
	HISTTIMEFORMAT="[%Y/%M/%D %H:%M:%S] "
	setopt hist_ignore_dups # 直前と同じコマンドをヒストリに追加しない
	setopt hist_ignore_all_dups # 重複するコマンドは古い法を削除する
	setopt share_history # 異なるウィンドウでコマンドヒストリを共有する
	setopt hist_no_store
	setopt hist_reduce_blanks
}


: "completion" && {
	zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
	zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
		/usr/sbin /usr/bin /sbin /bin
	zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
	setopt complete_in_word
}

# done


# platform check
if [ "$(uname)" "==" 'Darwin' ]; then
	OS='Mac'
elif [ "$(uname)" "==" 'Linux' ]; then
	OS='Linux'
else
	echo "Your platform ($(uname -a)) is not supported."
	exit 1
fi

export XDG_CONFIG_HOME=$HOME/.config
source $HOME/dotfiles/zsh/.zinitrc

export EDITOR=nvim
eval "$(direnv hook zsh)"

# Alias
# if [ $OS "==" 'Mac' ]; then
# 	alias ls='ls -G'
# 	alias la='ls -laG'
# 	alias ll='ls -lG'
# elif [ $OS "==" 'Linux' ]; then
# 	alias ls='ls --color=auto'
# 	alias la='ls --all --color=auto'
# 	alias ll='ls -l --color=auto'
# else
# 	echo "not supported without Mac and Linux"
# fi
alias vi='nvim'
# alias grep='grep --color'
alias cp='cp -i'
alias mv='mv -i'
alias rm='trash-put'
alias re='source $HOME/.zshrc'
alias cl='clear'
alias tmux='tmux -u'
alias tkill='tmux kill-session'
alias txmk='lualatex --synctex=1 -interaction=nonstopmode --output-directory=build'

# Alternative CLI
alias ls='exa --group-directories-first'
alias la='exa -aalh --git --time-style=iso --group-directories-first'
alias ll='exa -lh --git --time-style=iso --group-directories-first'
alias tree='exa -T --git-ignore'
alias grep='rg'

# Python
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"

# pipx completion
# eval "$(register-python-argcomplete pipx)"
export PATH="~/.local/bin:$PATH"

# TKinter setup
export PATH="/usr/local/opt/tcl-tk/bin:$PATH"
# export LDFLAGS="-L/usr/local/opt/tcl-tk/lib"
# export CPPFLAGS="-I/usr/local/opt/tcl-tk/include"
# export PKG_CONFIG_PATH="/usr/local/opt/tcl-tk/lib/pkgconfig"
# export PYTHON_CONFIGURE_OPTS="--with-tcltk-includes='-I/usr/local/opt/tcl-tk"

# Sage
export SAGE_ROOT=/usr/local/SageMath
export PATH="$SAGE_ROOT:$PATH"

# Rust
export PATH="$PATH:$HOME/.cargo/bin"

# Go
# Default: export GOPATH=$HOME/go
export GOPATH=$HOME/dev/go
export PATH=$GOPATH/bin:$PATH

# Node.js > nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH
export NODE_PATH=`npm root -g`

# tex/latex/texlive
export PATH=/usr/local/texlive/2019/bin/x86_64-darwin:$PATH

# Created by `userpath` on 2020-07-08 09:18:15
export PATH="$PATH:/Users/usr/.local/bin"
# export PATH="/usr/local/opt/bzip2/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
