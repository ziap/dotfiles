local set = vim.opt

-- Search
set.showmatch = true
set.ignorecase = true
set.smartcase = true
set.hlsearch = false
set.incsearch = true

-- Status
set.laststatus = 2

-- Indentation
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.autoindent = true
set.smartindent = true

-- Disable filetype plugins
-- LSP and treesitter are enough
vim.cmd("filetype plugin indent off")

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
