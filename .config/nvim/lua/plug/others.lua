require("nvim-autopairs").setup {}

require'nvim-treesitter.configs'.setup{
  ensure_installed = {
    'python', 'lua', 'c', 'cpp', 'rust', 'javascript', 'html', 'css',
    'markdown', 'markdown_inline', 'bash', 'jsdoc', 'glsl'
  },
  sync_install = false,
  highlight = { enable = true },
  autotag = { enable = true }
}

local telescope = require'telescope'

telescope.setup {
  extensions = {
    file_browser = {
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
    },
  },
}

telescope.load_extension'file_browser'
