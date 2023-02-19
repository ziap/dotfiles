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
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select

function zle-line-init() {
    zle -K viins
    echo -ne '\e[5 q'
}
zle -N zle-line-init

echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' }

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
alias cat='bat --theme=gruvbox-dark --color=always'

## Shorthands
alias nv='nvim'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias duh='du -h'
alias icat='wezterm imgcat'

## Fuzzy finder utilities
alias frm='rm -rf $(exa | sk -m)'
alias fcd='cd $(fd --type=d | sk --preview "exa {} --icons -la")'
alias fgd='cd $(dirname $(fd -H -g \*.git ~/*/) | sk --preview "exa {} --git-ignore --icons -lT")'
alias fca='bat $(fd --type=file | sk --preview="bat {} --theme=gruvbox-dark --color=always") --theme=gruvbox-dark --color=always'
alias fxo='xdg-open $(fd --type=file | sk --preview "file {}")'
alias frg='sk --ansi -ic "rg --color=always --line-number {}"'

## Quickly start a dev server
alias sv='python -m http.server 3000'

## Pandoc settings mostly for compiling markdown
alias mdc='pandoc \
  -s --pdf-engine=xelatex \
  -V "monofont:FiraCode Nerd Font" \
  -V "numbersections:true" \
  -V "geometry:margin=30mm"'

# ---- PLUGINS ----------------------------------

## Starship phrompt
eval "$(starship init zsh)"

## Syntax highlighting and suggestion
. /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
. /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
