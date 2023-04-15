-- Helper function 
local function bind(mode)
  return function(lhs, rhs, silent)
    local options = {
      noremap = true,
      silent = silent or false
    }
    vim.keymap.set(mode, lhs, rhs, options)
  end
end

local nmap = bind('n') -- nnoremap
local imap = bind('i') -- inoremap
local vmap = bind('v') -- vnoremap
local tmap = bind('t') -- tnoremap

-- Set leader key
vim.g.mapleader = ' '

nmap('<leader>n', vim.diagnostic.goto_next, true)
nmap('<leader>N', vim.diagnostic.goto_prev, true)

-- Telescope keybinds
nmap('<leader>f', '<cmd>Telescope find_files<cr>')
nmap('<leader>g', '<cmd>Telescope live_grep<cr>')
nmap('<leader>b', '<cmd>Telescope buffers<cr>')
nmap('<leader>h', '<cmd>Telescope help_tags<cr>')
nmap('<leader>e', '<cmd>Telescope file_browser<cr>')

-- Move around split windows with less keystrokes
nmap('<c-h>', '<cmd>wincmd h<cr>', true)
nmap('<c-j>', '<cmd>wincmd j<cr>', true)
nmap('<c-k>', '<cmd>wincmd k<cr>', true)
nmap('<c-l>', '<cmd>wincmd l<cr>', true)

-- Make working with terminal windows easier
local exit_term = '<c-\\><c-n>'
tmap('<esc>', exit_term, true)
tmap('<c-h>', exit_term..'<cmd>wincmd h<cr>', true)
tmap('<c-j>', exit_term..'<cmd>wincmd j<cr>', true)
tmap('<c-k>', exit_term..'<cmd>wincmd k<cr>', true)
tmap('<c-l>', exit_term..'<cmd>wincmd l<cr>', true)

-- Create terminal window
nmap('<leader>t', '<cmd>new<cr><cmd>terminal<cr><cmd>resize 15<cr><cmd>startinsert<cr>')

-- Create split panes
nmap('<leader>v', '<cmd>vertical new<cr>', true)
nmap('<leader>x', '<cmd>new<cr>', true)
nmap('<leader>o', '<cmd>wincmd o<cr>', true)

-- Keybinds with shift
nmap('Y', 'y$') -- Yank to the end
nmap('U', '<cmd>redo<cr>') -- Redo
vmap('J', 'j')
vmap('K', 'k')

-- Filthy emacs(ish) bindings
nmap('<c-n>', '<c-d>zz')
nmap('<c-p>', '<c-u>zz')

-- Move line up and down
nmap('<a-j>', '<cmd>move +1<cr>', true)
nmap('<a-k>', '<cmd>move -2<cr>', true)
imap('<a-j>', '<esc><cmd>move +1<cr>a', true)
imap('<a-k>', '<esc><cmd>move -2<cr>a', true)

-- Move selection up and down
vmap('<a-j>', '<cmd>move \'>+1<cr>gv', true)
vmap('<a-k>', '<cmd>move \'<-2<cr>gv', true)

-- Replace text
nmap('s', '<cmd>s//g<left><left>') -- Line
nmap('S', '<cmd>%s//g<left><left>') -- All
vmap('s', '<cmd>s//g<left><left>') -- Selection

-- Prevent Ctrl-C from canceling block insertion
imap('<c-c>', '<esc>')

-- Toggle light and dark theme
nmap('<c-r>', function()
  if vim.opt.background:get() == 'dark' then
    vim.opt.background = 'light'
  else
    vim.opt.background = 'dark'
  end
end, true)

