{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      format = ''
[░▒▓](fg:white)$username$nix_shell[](bg:bright-blue fg:white)$directory[](fg:bright-blue bg:bright-cyan)$git_branch$git_status[](fg:bright-cyan bg:bright-green)$python$elixir$elm$golang$java$julia$nodejs$nim$rust[](fg:bright-green bg:bright-yellow)$docker_context[](fg:bright-yellow)
$character'';
      username = {
        show_always = true;
        style_user = "bg:white fg:black bold";
        style_root = "bg:white fg:black bold";
        format = "[ 󱄅 $user ]($style)";
      };
      nix_shell = {
        style = "bg:white fg:black bold";
        format = "[\\($name\\) ]($style)";
      };
      directory = {
        style = "bg:bright-blue fg:black";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
        substitutions = {
          Documents = "󰈙 ";
          Downloads = " ";
          Music = " ";
          Pictures = " ";
        };
      };
      git_branch = {
        symbol = "";
        style = "bg:bright-cyan fg:black";
        format = "[[ $symbol $branch ](bg:bright-cyan fg:black)]($style)";
      };
      git_status = {
        style = "bg:bright-cyan fg:black";
        format = "[[($all_status$ahead_behind )](bg:bright-cyan fg:black)]($style)";
      };
      docker_context = {
        symbol = "";
        style = "bg:bright-yellow fg:black";
        format = "[[ $symbol $context ](bg:bright-yellow fg:black)]($style) $path";
      };
      python = {
        symbol = "";
        style = "bg:bright-green fg:black";
        format = "[[ $symbol ($version) (\\($virtualenv\\)) ](bg:bright-green fg:black)]($style)";
      };
      elixir = {
        symbol = "";
        style = "bg:bright-green fg:black";
        format = "[[ $symbol ($version) ](bg:bright-green fg:black)]($style)";
      };
      elm = {
        symbol = "";
        style = "bg:bright-green fg:black";
        format = "[[ $symbol ($version) ](bg:bright-green fg:black)]($style)";
      };
      golang = {
        symbol = "";
        style = "bg:bright-green fg:black";
        format = "[[ $symbol ($version) ](bg:bright-green fg:black)]($style)";
      };
      java = {
        symbol = "";
        style = "bg:bright-green fg:black";
        format = "[[ $symbol ($version) ](bg:bright-green fg:black)]($style)";
      };
      julia = {
        symbol = "";
        style = "bg:bright-green fg:black";
        format = "[[ $symbol ($version) ](bg:bright-green fg:black)]($style)";
      };
      nodejs = {
        symbol = "";
        style = "bg:bright-green fg:black";
        format = "[[ $symbol ($version) ](bg:bright-green fg:black)]($style)";
      };
      nim = {
        symbol = "";
        style = "bg:bright-green fg:black";
        format = "[[ $symbol ($version) ](bg:bright-green fg:black)]($style)";
      };
      rust = {
        symbol = "";
        style = "bg:bright-green fg:black";
        format = "[[ $symbol ($version) ](bg:bright-green fg:black)]($style)";
      };
    };
  };
}
