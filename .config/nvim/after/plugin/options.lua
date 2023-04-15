local set = vim.opt

-- Search
set.showmatch = true
set.ignorecase = true
set.smartcase = true
set.hlsearch = true
set.incsearch = true

-- Clear hlsearch when move
vim.on_key(function(char)
  if vim.fn.mode() == "n" then
    local hlsearch = string.match("nN*#?/", char) ~= nil
    if vim.opt.hlsearch ~= hlsearch then
      vim.opt.hlsearch = hlsearch
    end
  end
end, nil)

-- Status
set.laststatus = 2

-- Indentation
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.autoindent = true
set.smartindent = true

-- Integration
set.mouse = 'nv'
set.clipboard = 'unnamedplus'
set.ttyfast = true

-- Layout
set.number = true
set.relativenumber = true
set.cursorline = true

-- Disable backup
set.backup = false
set.writebackup = false

-- Split panes
set.splitright = true
set.splitbelow = true
