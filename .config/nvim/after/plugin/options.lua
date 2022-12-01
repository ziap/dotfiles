local opt = vim.opt

-- Search
opt.showmatch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- Status
opt.laststatus = 2

-- Indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
vim.cmd("filetype plugin indent off")

-- Integration
opt.mouse = 'nv'
opt.clipboard = 'unnamedplus'
opt.ttyfast = true

-- Layout
opt.number = true
opt.relativenumber = true
opt.cursorline = true

-- Disable backup
opt.backup = false
opt.writebackup = false

-- Split panes
opt.splitright = true
opt.splitbelow = true
