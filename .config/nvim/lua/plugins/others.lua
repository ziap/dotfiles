require'nvim-autopairs'.setup{}
require'nvim-treesitter.configs'.setup{
  ensure_installed = { 'python', 'lua', 'c', 'cpp', 'rust', 'javascript', 'html', 'css', 'markdown' },
    
  sync_install = false,

  highlight = { enable = true }
}
