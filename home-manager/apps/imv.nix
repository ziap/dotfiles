{ config, pkgs, ... }:

{
  programs.imv = {
    enable = true;
    settings = {
      options.background = "282828";
    };
  };
}
