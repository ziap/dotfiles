# +------------------------+
# | ZSH Configuration file |
# +------------------------+

# History
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# Completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)	

# Keybinds
bindkey -v

## Ctrl-P and Ctrl-N for navigating history
function _hist_nav_down {
  zle end-of-line
  zle down-history
}

zle -N _hist_nav_down

bindkey '^P' up-history
bindkey '^N' _hist_nav_down

## Vim binding in tab completion select menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# Aliases
alias ls='exa --icons'
alias ll='exa --icons -l'
alias la='exa --icons -a'
alias lla='exa --icons -la'
alias tree='exa --icons -T'
alias cat='bat --style=numbers,grid --theme=gruvbox-dark'
alias nv='nvim'

# Change xterm title
case $TERM in
    xterm*)
        precmd () {print -Pn "\e]0;%~\a"}
        ;;
esac

# Beam cursor
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' ;}

# Plugins

## Starship phrompt
eval "$(starship init zsh)"

## Syntax highlighting and suggestion
. /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
. /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
