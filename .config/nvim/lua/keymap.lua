-- Helper function 
local function bind(mode)
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

-- Set leader key
vim.g.mapleader = ' '

-- Lspsaga keybinds
nmap('<leader>r', ':Lspsaga rename<cr>', true)
nmap('<leader>c', ':Lspsaga code_action<cr>', true)
nmap('<leader>d', ':Lspsaga lsp_finder<cr>', true)
nmap('K', ':Lspsaga hover_doc<cr>', true)
nmap('J', ':Lspsaga diagnostic_jump_next<cr>', true)

-- Telescope keybinds
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

-- Toggle terminal
nmap('<a-t>', ':new<cr>:terminal<cr>:resize 15<cr>:startinsert<cr>')
tmap('<a-t>', exit_term..':bwipeout!<cr>', true)

-- Create split panes
nmap('<leader><leader>', ':vertical new<cr>', true)
nmap('<leader><cr>', ':new<cr>', true)

-- Keybinds with shift
nmap('Y', 'y$') -- Yank to the end
nmap('U', ':redo<cr>') -- Redo
vmap('J', 'j')
vmap('K', 'k')

-- Filthy emacs(ish) bindings
nmap('<c-n>', '<c-d>zz')
nmap('<c-p>', '<c-u>zz')

-- Move line up and down
nmap('<a-j>', ':move +1<cr>', true)
nmap('<a-k>', ':move -2<cr>', true)
imap('<a-j>', '<esc>:move +1<cr>a', true)
imap('<a-k>', '<esc>:move -2<cr>a', true)

-- Move selection up and down
vmap('<a-j>', ':move \'>+1<cr>gv', true)
vmap('<a-k>', ':move \'<-2<cr>gv', true)

-- Replace text
nmap('s', ':s//g<left><left>') -- Line
nmap('S', ':%s//g<left><left>') -- All
vmap('s', ':s//g<left><left>') -- Selection
