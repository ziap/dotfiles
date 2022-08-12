-- Start inserting when entering terminal buffer
vim.api.nvim_create_autocmd(
  { 'BufWinEnter', 'WinEnter' },
  {
    pattern = { "term://*" },
    command = "startinsert" 
  }
)
