-- Helper function 
function bind(mode)
  return function(lhs, rhs, silent)
    local options = {
      noremap = true,
      silent = silent or false
    }
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
  end
end

local nmap = bind('n') -- nnoremap
local imap = bind('i') -- inoremap
local vmap = bind('v') -- vnoremap
local tmap = bind('t') -- tnoremap

-- Lspsaga keybinds
nmap('K', ':Lspsaga hover_doc<cr>', true)
nmap('gh', ':Lspsaga lsp_finder<cr>', true)
nmap('gr', ':Lspsaga rename<cr>', true)

-- Telescope keybinds
vim.g.mapleader = ' '
nmap('<leader>f', ':Telescope find_files<cr>')
nmap('<leader>g', ':Telescope live_grep<cr>')
nmap('<leader>b', ':Telescope buffers<cr>')
nmap('<leader>h', ':Telescope help_tags<cr>')
nmap('<leader>e', ':Telescope file_browser<cr>')

-- Move around split windows with less keystrokes
nmap('<c-h>', ':wincmd h<cr>', true)
nmap('<c-j>', ':wincmd j<cr>', true)
nmap('<c-k>', ':wincmd k<cr>', true)
nmap('<c-l>', ':wincmd l<cr>', true)

-- Make working with terminal windows easier
local exit_term = '<c-\\><c-n>'
tmap('<esc>', exit_term, true)
tmap('<c-h>', exit_term..':wincmd h<cr>', true)
tmap('<c-j>', exit_term..':wincmd j<cr>', true)
tmap('<c-k>', exit_term..':wincmd k<cr>', true)
tmap('<c-l>', exit_term..':wincmd l<cr>', true)

-- Create and remove split windows
nmap('<leader><leader>', ':vertical split<cr>', true)
nmap('<leader><cr>', ':split<cr>', true)
nmap('<leader>t', ':terminal<cr>', true)
nmap('<leader>w', ':q<cr>', true)

nmap('Y', 'y$') -- Yank to the end
nmap('U', ':redo<cr>') -- Redo

-- Replace text
nmap('s', ':s//g<left><left>') -- Line
nmap('S', ':%s//g<left><left>') -- All
vmap('s', ':s//g<left><left>') -- Selection
