vim.opt.background = 'dark'
vim.cmd.colorscheme 'gruvbox'

local filename = {
  'filename',
  path = 1,
  symbols = {
    modified = '[+]',
    readonly = '[]',
    unnamed = '[No Name]',
    newfile = '[New]'
  }
}

local function location()
  local total = vim.api.nvim_buf_line_count(0)
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))

  return tostring(row).."/"..total..":"..tostring(col + 1)
end

local function md_wordcount()
  if vim.bo.filetype == "markdown" then
    local wc = vim.fn.wordcount()
    local words = "/"..tostring(wc.words).." words"
    if wc.visual_words ~= nil then
      return tostring(wc.visual_words)..words
    end
    return tostring(wc.cursor_words)..words
  end
  return ""
end

require'lualine'.setup {
  options = {
    theme = 'gruvbox',
    component_separators = {
      left = '\u{E0B9}',
      right = '\u{E0B7}'
    },
    section_separators = {
      left = '\u{E0B8}',
      right = '\u{E0B6}'
    },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { filename },
    lualine_x = { 'encoding', 'fileformat', md_wordcount },
    lualine_y = { 'filetype' },
    lualine_z = { location }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { filename },
    lualine_x = { 'filetype' },
    lualine_y = { location },
    lualine_z = {}
  }
}
