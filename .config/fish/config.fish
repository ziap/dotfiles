if status is-interactive
  # Commands to run in interactive sessions can go here
end

function fish_greeting
  set c1 (set_color brred)
  set c2 (set_color brgreen)
  set c3 (set_color bryellow)
  set c4 (set_color brblue)
  set c5 (set_color brmagenta)
  set c6 (set_color brcyan)
  set c7 (set_color brwhite)
  
  echo "
  $c1  ▄██████▄    $c2  ▄██████▄    $c4  ▄██████▄    $c5  ▄██████▄    $c6  ▄██████▄    
  $c1▄$c7█▀█$c1██$c7█▀█$c1██▄  $c2▄$c7█▀█$c2██$c7█▀█$c2██▄  $c4▄$c7█▀█$c4██$c7█▀█$c4██▄  $c5▄$c7█▀█$c5██$c7█▀█$c5██▄  $c6▄$c7█▀█$c6██$c7█▀█$c6██▄
  $c1█$c7▄▄█$c1██$c7▄▄█$c1███  $c2█$c7▄▄█$c2██$c7▄▄█$c2███  $c4█$c7▄▄█$c4██$c7▄▄█$c4███  $c5█$c7▄▄█$c5██$c7▄▄█$c5███  $c6█$c7▄▄█$c6██$c7▄▄█$c6███
  $c1████████████  $c2████████████  $c4████████████  $c5████████████  $c6████████████  
  $c1██▀██▀▀██▀██  $c2██▀██▀▀██▀██  $c4██▀██▀▀██▀██  $c5██▀██▀▀██▀██  $c6██▀██▀▀██▀██  
  $c1▀   ▀  ▀   ▀  $c2▀   ▀  ▀   ▀  $c4▀   ▀  ▀   ▀  $c5▀   ▀  ▀   ▀  $c6▀   ▀  ▀   ▀  
"

  set_color normal
end

set -x EDITOR $(which nvim)
set -x GTK_IM_MODULE fcitx
set -x QT_IM_MODULE fcitx
set -x XMODIFIERS "@im=fcitx"

function cat
  bat --theme=gruvbox-dark $argv
end

function ls
  eza --git --icons $argv
end

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
  cd $(mktemp -d)
end

alias ll "ls -l"
alias la "ls -a"
alias lla "ls -la"
alias nv "nvim"

function fish_hybrid_key_bindings --description \
  "Vi-style bindings that inherit emacs-style bindings in insert mode"
  fish_default_key_bindings -M insert
  fish_vi_key_bindings --no-erase
end

set -g fish_key_bindings fish_hybrid_key_bindings

# Emulates vim's cursor shape behavior
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore
set fish_cursor_external line
set fish_cursor_visual block
