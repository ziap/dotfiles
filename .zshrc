# +------------------------+
# | ZSH Configuration file |
# +------------------------+

# ---- HISTORY ----------------------------------
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# ---- Completion -------------------------------
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)	

# ---- VI MODE CONFIG ---------------------------

## Activate vi mode.
bindkey -v

## Remove mode switching delay.
KEYTIMEOUT=5

## Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

## Use beam shape cursor on startup.
echo -ne '\e[5 q'

## Use beam shape cursor for each new prompt.
preexec() {
   echo -ne '\e[5 q'
}

# ---- KEYBINDS ---------------------------------

## Emacs binding in insert mode
bindkey -M main '^P' up-line-or-history
bindkey -M main '^N' down-line-or-history
bindkey -M main '^F' forward-char
bindkey -M main '^B' backward-char

bindkey '^@' autosuggest-accept

## Vim binding in tab completion select menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# ---- ALIASES ----------------------------------

## Same command but with extra features
alias ls='exa --git --icons'
alias cat='bat --theme=gruvbox-dark'

## Shorthands
alias nv='nvim'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias duh='du -h'

## Quickly start a dev server
alias sv='python -m http.server 3000'

## Pandoc settings mostly for compiling markdown
alias mdc='pandoc \
  -s --pdf-engine=xelatex \
  -V "monofont:FiraCode Nerd Font" \
  -V "numbersections:true" \
  -V "geometry:margin=30mm"'

# ---- CHANGE XTERM TITLE -----------------------
case $TERM in
    xterm*)
        precmd () {print -Pn "\e]0;%~\a"}
        ;;
esac

# ---- PLUGINS ----------------------------------

## Starship phrompt
eval "$(starship init zsh)"

## Syntax highlighting and suggestion
. /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
. /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
