{ config, pkgs, ... }:

{
  programs.neovim = let
    theme = import ../../themes/current-theme.nix;
  in {
    enable = true;
    defaultEditor = true;

    withNodeJs = false;
    withPython3 = false;
    withRuby = false;

    plugins = with pkgs.vimPlugins; [
      plenary-nvim
      nvim-web-devicons
      telescope-nvim
      nvim-treesitter.withAllGrammars
      lualine-nvim
      blink-cmp
      nvim-lspconfig
      pkgs.vimPlugins.${theme.nvim.plugin}
    ];

    extraPackages = with pkgs; [
      xclip
      wl-clipboard

      # LSPs for languages that doesn't need complex version management
      vscode-langservers-extracted
      nodePackages.typescript-language-server
      emmet-ls
      clang-tools
    ];

    initLua = /* lua */ ''
      vim.cmd.colorscheme '${theme.nvim.colorscheme}'
      vim.opt.background = 'dark'

      require'telescope'.setup{}
      ${builtins.readFile ./plugins/lualine.lua}
      ${builtins.readFile ./plugins/treesitter.lua}
      ${builtins.readFile ./plugins/lsp.lua}
      ${builtins.readFile ./plugins/cmp.lua}

      ${builtins.readFile ./options.lua}
      ${builtins.readFile ./keymap.lua}
      ${builtins.readFile ./autocmd.lua}
    '';
  };
}
