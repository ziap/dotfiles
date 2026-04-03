{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Zap";
        email = "67962871+ziap@users.noreply.github.com";
      };
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      line-numbers = true;
      syntax-theme = "gruvbox-dark";
      side-by-side = false;
      file-modified-label = "modified:";
    };
  };
}

