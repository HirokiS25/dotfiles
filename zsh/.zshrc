
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
autoload -Uz colors ; colors
setopt extended_glob
setopt auto_cd
setopt no_beep
setopt auto_param_slash
setopt mark_dirs
setopt no_clobber
setopt list_types
setopt auto_menu
setopt auto_param_keys
setopt complete_in_word
setopt noautoremoveslash

HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
HISTTIMEFORMAT="[%Y/%M/%D %H:%M:%S] "

LISTMAX=1000

zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
	/usr/sbin /usr/bin /sbin /bin
# done

zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

export XDG_CONFIG_HOME=$HOME/.config
source $HOME/dotfiles/zsh/.zinitrc

# Alias
alias ls='ls --color=auto'
alias la='ls --la --color=auto'
alias ll='ls --l --color=auto'
alias vim='nvim'

# Python
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"

# Sage
export SAGE_ROOT=/usr/local/SageMath
export PATH="$SAGE_ROOT:$PATH"

# Rust
export PATH="$PATH:$HOME/.cargo/bin"

# Go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
