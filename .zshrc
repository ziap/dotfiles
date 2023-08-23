# +------------------------+
# | ZSH Configuration file |
# +------------------------+

# ---- EXPORTS ----------------------------------

export EDITOR=/usr/bin/nvim
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

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
zle-keymap-select() {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select

zle-line-init() {
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

# ---- FUNCTIONS --------------------------------

## Same command but with extra features
function ls { exa --git --icons $@ }
function cat { bat --theme=gruvbox-dark $@ }

## Fuzzy finder utilities
function frm { fd --type=file | sk -m --preview 'file {}' | xargs -d '\n' rm }
function fcd { cd "$(fd --type=d | sk --preview 'exa {} --icons -la')" }
function fgd { cd $(dirname $(fd -H -g \*.git ~/*/) | sk --preview 'exa {} --git-ignore --icons -T') }
function fca { bat "$(fd --type=file | sk --preview='bat {} --theme=gruvbox-dark --color=always')" }
function fxo { xdg-open "$(fd --type=file | sk --preview 'file {}')" }
function frg { sk --ansi -ic "rg {} --color=always --line-number" }

## Quickly start a dev server
function sv { python -m http.server 3000 $@ }

## Pandoc settings mostly for compiling markdown
function mdc {
  pandoc $@ \
    -s --pdf-engine=xelatex \
    -V "numbersections:true" \
    -V "geometry:margin=30mm"
}

## Just mkdir followed by cd
mkcd() { mkdir "$1" && cd "$1" }

# ---- ALIASES ----------------------------------

alias nv='nvim'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias duh='du -h'

# ---- PROMPT -----------------------------------
autoload -Uz vcs_info

function precmd { vcs_info }

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats '  %b'
zstyle ':vcs_info:*' actionformats '  %b (%a)'

setopt prompt_subst

PROMPT='%K{magenta} %n %F{magenta}%K{yellow}%k%F{yellow}%f '
RPROMPT='%(?..%F{red}󰀦 %?%f )%F{blue}%~%f%F{magenta}${vcs_info_msg_0_}%f'

# ---- PLUGINS ----------------------------------

## Syntax highlighting and suggestion
. /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
. /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
