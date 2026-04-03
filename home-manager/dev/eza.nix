{ config, pkgs, ... }:

{
  programs.eza = {
    enable = true;
    colors = "auto";
    git = true;
    icons = "auto";
  };
}
