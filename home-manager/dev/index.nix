{ config, pkgs, nix-neovim, ... }:

let 
  system = pkgs.stdenv.hostPlatform.system;
  neovim = nix-neovim.packages.${system}.default;
in {
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
    EDITOR = "${neovim}/bin/nvim";
    MANPAGER = "${neovim}/bin/nvim +Man!";
  };

  # Essential packages to enable but not worth its own module
  home.packages = [
    neovim
  ] ++ (with pkgs; [
    fd ripgrep skim
    tokei htop

    clang
    # Everything else can be installed in development shells
  ]);
}
