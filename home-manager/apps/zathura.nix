{ config, pkgs, ... }:

{
  programs.zathura = {
    enable = true;
    options = {
      selection-clipboard = "clipboard";

      font = "FiraCode Nerd Font 12";

      default-bg = "#282828";
      default-fg = "#EBDBB2";

      completion-bg = "#3C3836";
      completion-fg = "#EBDBB2";
      completion-highlight-bg = "#83A598";
      completion-highlight-fg = "#282828";
      completion-group-bg = "#3C3836";
      completion-group-fg = "#EBDBB2";

      statusbar-bg = "#3C3836";
      statusbar-fg = "#EBDBB2";

      inputbar-bg = "#3C3836";
      inputbar-fg = "#EBDBB2";

      notification-bg = "#3C3836";
      notification-fg = "#EBDBB2";
      notification-error-bg = "#3C3836";
      notification-error-fg = "#FB4934";
      notification-warning-bg = "#3C3836";
      notification-warning-fg = "#FABD2F";

      highlight-color = "#83A598";

      recolor = true;
      recolor-keephue = true;
      recolor-lightcolor = "#282828";
      recolor-darkcolor = "#EBDBB2";
    };
  };
}
