require'nvim-autopairs'.setup{}
require'nvim-treesitter.configs'.setup{
  ensure_installed = {
    'python', 'lua', 'c', 'cpp', 'rust', 'javascript', 'html', 'css',
    'markdown', 'markdown_inline', 'bash', 'jsdoc'
  },
  sync_install = false,
  highlight = { enable = true },
  autotag = { enable = true }
}
