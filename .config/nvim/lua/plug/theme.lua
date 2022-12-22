vim.opt.background = 'dark'
vim.cmd.colorscheme 'gruvbox'

require'lualine'.setup {
  options = {
    theme = 'gruvbox',
    component_separators = {
      left = '\u{E0B9}',
      right = '\u{E0BB}'
    },
    section_separators = {
      left = '\u{E0B8}',
      right = '\u{E0BA}'
    },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'fileformat' },
    lualine_y = { 'filetype' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'filetype' },
    lualine_y = { 'location' },
    lualine_z = {}
  }
}
