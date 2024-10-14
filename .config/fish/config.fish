# Disable the greeting message
set fish_greeting

# Shell exports
set -x EDITOR (which nvim)
set -x GTK_IM_MODULE fcitx
set -x QT_IM_MODULE fcitx
set -x XMODIFIERS "@im=fcitx"

alias cat "bat"
alias ls "eza --git --icons"
alias ll "ls -l --bytes"
alias la "ls -a"
alias lla "ls -la --bytes"
alias nv "nvim"

function mdc
  pandoc $argv \
    -s --pdf-engine=xelatex \
    -V "numbersections:true" \
    -V "geometry:margin=30mm"
end

function mkcd
  mkdir $argv
  cd $argv
end

function cdtemp
  cd (mktemp -d)
end

# Vim keybindings

function fish_hybrid_key_bindings
  # Emacs binding in insert mode
  fish_default_key_bindings -M insert
  fish_vi_key_bindings --no-erase
end

set -g fish_key_bindings fish_hybrid_key_bindings
bind -M insert -k nul accept-autosuggestion
bind -M insert \cF edit_command_buffer

set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore
set fish_cursor_external line
set fish_cursor_visual block
