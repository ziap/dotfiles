{ config, pkgs, nix-neovim, ... }:

{
  # Configure the development environment
  imports = [
    ./fish.nix
    ./zsh.nix
    ./nushell.nix
    ./bat.nix
    ./eza.nix
    ./git.nix
    ./starship.nix
  ];

  # Use Neovim to view manpages
  home.sessionVariables = {
    MANPAGER = "${nix-neovim.packages.${pkgs.system}.default}/bin/nvim +Man!";
  };

  # Essential packages to enable but not worth its own module
  home.packages = [
    nix-neovim.packages.${pkgs.system}.default
  ] ++ (with pkgs; [
    fd ripgrep skim
    tokei htop

    clang
    # Everything else can be installed in development shells
  ]);
}
