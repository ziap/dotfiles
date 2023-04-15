local autocmd = vim.api.nvim_create_autocmd

-- Start inserting after entering terminal buffer
autocmd({ 'BufWinEnter', 'WinEnter' }, {
  pattern = { 'term://*' },
  command = 'startinsert' 
})

-- Use correct filetype for glsl
autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { '*.frag', '*.vert' },
  command = 'set filetype=glsl' 
})

-- Turn on quickfix menu automatically
autocmd('QuickFixCmdPost', {
  pattern = '[^l]*',
  nested = true,
  command = 'cwindow'
})

-- Same as above but for location list
autocmd('QuickFixCmdPost', {
  pattern = 'l*',
  nested = true,
  command = 'lwindow'
})

-- Highlight yank
autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({
      higroup = 'Visual',
      timeout = 100,
    })
  end
})
