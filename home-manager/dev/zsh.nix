{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    completionInit = /*sh*/ ''
      autoload -U compinit
      zstyle ':completion:*' menu select
      zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
      zmodload zsh/complist
      compinit
      _comp_options+=(globdots)	
    '';
    autosuggestion = {
      enable = true;
      strategy = [ 
        "completion"
        "history"
      ];
    };
    syntaxHighlighting.enable = true;

    initContent = /*sh*/ ''
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

      mkcd() { mkdir "$1" && cd "$1" }
      
      zle-line-init() {
        zle -K viins
        echo -ne '\e[5 q'
      }
      zle -N zle-line-init
      
      echo -ne '\e[5 q'
      preexec() { echo -ne '\e[5 q' }

      ## Emacs binding in insert mode
      bindkey -M main '^P' up-line-or-history
      bindkey -M main '^N' down-line-or-history

      ## Command buffer editing
      autoload -Uz edit-command-line
      zle -N edit-command-line
      bindkey -M main '^F' edit-command-line

      ## Selection menu navigation
      bindkey -M menuselect '^B' backward-char
      bindkey -M menuselect '^F' forward-char

      ## Accept autosuggestion
      bindkey -M main '^ ' autosuggest-accept
    '';
    shellAliases = import ./shell-aliases.nix "zsh" // {
      cdtemp = "cd `mktemp -d`";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };
}
