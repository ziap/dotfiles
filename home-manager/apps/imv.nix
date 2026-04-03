{ config, pkgs, ... }:

{
  programs.imv = {
    enable = true;
    settings = {
      options.background = let
        theme = import ../themes/current-theme.nix;
      in "${theme.background0}";
    };
  };
}
