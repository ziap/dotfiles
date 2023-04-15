-- Search
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Clear hlsearch when move
vim.on_key(function(char)
  if vim.fn.mode() == "n" then
    local hlsearch = string.find("nN*#/?", char, 1, true) ~= nil

    if vim.opt.hlsearch:get() ~= hlsearch then
      vim.opt.hlsearch = hlsearch
    end
  end
end, nil)

-- Status
vim.opt.laststatus = 2

-- Indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Integration
vim.opt.mouse = 'nv'
vim.opt.clipboard = 'unnamedplus'
vim.opt.ttyfast = true

-- Layout
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Disable backup
vim.opt.backup = false
vim.opt.writebackup = false

-- Split panes
vim.opt.splitright = true
vim.opt.splitbelow = true
