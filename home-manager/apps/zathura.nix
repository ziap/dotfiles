{ config, pkgs, ... }:

{
  programs.zathura = {
    enable = true;
    options = let
      theme = import ../themes/current-theme.nix;
    in {
      selection-clipboard = "clipboard";

      font = "FiraCode Nerd Font 12";

      default-bg = "#${theme.background0}";
      default-fg = "#${theme.foreground}";

      completion-bg = "#${theme.background1}";
      completion-fg = "#${theme.foreground}";
      completion-highlight-bg = "#${theme.bright4}";
      completion-highlight-fg = "#${theme.background0}";
      completion-group-bg = "#${theme.background1}";
      completion-group-fg = "#${theme.foreground}";
      
      statusbar-bg = "#${theme.background1}";
      statusbar-fg = "#${theme.foreground}";
      
      inputbar-bg = "#${theme.background1}";
      inputbar-fg = "#${theme.foreground}";
      
      notification-bg = "#${theme.background1}";
      notification-fg = "#${theme.foreground}";
      notification-error-bg = "#${theme.background1}";
      notification-error-fg = "#${theme.bright1}";
      notification-warning-bg = "#${theme.background1}";
      notification-warning-fg = "#${theme.bright3}";
      
      highlight-color = "#${theme.bright4}";
      
      recolor = true;
      recolor-keephue = true;
      recolor-lightcolor = "#${theme.background0}";
      recolor-darkcolor = "#${theme.foreground}" ;
    };
  };
}
