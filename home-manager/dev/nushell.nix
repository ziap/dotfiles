{ config, pkgs, ... }:

{
  programs.nushell = {
    enable = true;
    configFile = {
      text = /*nu*/ ''
        $env.config = {
          show_banner: false,
        }
      '';
    };
  };
}
