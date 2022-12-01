local autocmd = vim.api.nvim_create_autocmd

-- Start inserting after entering terminal buffer
autocmd(
  { 'BufWinEnter', 'WinEnter' },
  {
    pattern = { 'term://*' },
    command = 'startinsert' 
  }
)

-- Highlight terminal output
-- NOTE: don't enable yaml treesitter for this to work
autocmd(
  { 'TermOpen' },
  {
    command = 'set filetype=yaml'
  }
)

-- Highlight yank
autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({
      higroup = 'Visual',
      timeout = 100,
    })
  end,
})
