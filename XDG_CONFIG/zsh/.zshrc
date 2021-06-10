source $XDG_CONFIG_HOME/bin/global.sh
source $XDG_CONFIG_HOME/bin/shortCuts

# XDG Environment variables
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

[ ! -d $XDG_CONFIG_HOME ] && mkdir -p $XDG_CONFIG_HOME
[ ! -d $XDG_CACHE_HOME ] && mkdir -p $XDG_CACHE_HOME

# Set vimrc's location and source it on vim startup
# export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

autoload -Uz compinit promptinit colors zsh/terminfo compaudit vcs_info
compinit
promptinit
colors
compaudit

PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# ' 

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{red}(%b)%r%f'
zstyle ':vcs_info:*' enable git

setopt COMPLETE_ALIASES
setopt correctall
setopt hist_ignore_all_dups
setopt autocd

zstyle ':completion::complete:*' gain-privileges 1

#---------------------------------------------------
# History Stuff
# --------------------------------------------------
HISTFILE=$XDG_CONFIG_HOME/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000


#---------------------------------------------------
# Keybinding
# --------------------------------------------------
bindkey -v

