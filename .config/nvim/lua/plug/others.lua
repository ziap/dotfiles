require("nvim-autopairs").setup {}

require'nvim-treesitter.configs'.setup{
  ensure_installed = {
    'python', 'lua', 'c', 'cpp', 'rust', 'javascript', 'html', 'css',
    'markdown', 'markdown_inline', 'bash', 'jsdoc', 'glsl'
  },
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },
  autotag = { enable = true }
}

local telescope = require'telescope'

telescope.setup {}
