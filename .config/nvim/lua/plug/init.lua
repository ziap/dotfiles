local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.vim/plugged')
  -- Theming plugins
  Plug 'ellisonleao/gruvbox.nvim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  
  -- LSP
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/vim-vsnip-integ'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'

  -- Treesitter
  Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
  
  -- Extra functionalities
  Plug 'windwp/nvim-autopairs'
  Plug 'windwp/nvim-ts-autotag'
  Plug 'nvim-lua/plenary.nvim'
  
  -- Telescope
  Plug 'nvim-telescope/telescope.nvim'
vim.call'plug#end'

require'plug.theme'
require'plug.cmp'
require'plug.lsp'
require'plug.others'

