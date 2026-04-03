shell: {
  cat = "bat";
  ls = "eza";
  ll = "ls -l";
  la = "ls -a";
  lla = "ls -la";
  nv = "nvim";
  nsh = "nix-shell --run ${shell}";
  dev = "nix develop --command ${shell}";
}
