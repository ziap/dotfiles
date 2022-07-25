function bind(mode)
  return function(lhs, rhs, silent)
    local options = {
      noremap = true,
      silent = silent or false
    }
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
  end
end

local nmap = bind('n') -- nnoremap in vimscript
local tmap = bind('t') -- tnoremap in vimscript

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

local exit_term = '<c-\\><c-n>'

-- Move around split windows
nmap('<c-h>', ':wincmd h<cr>', true)
nmap('<c-j>', ':wincmd j<cr>', true)
nmap('<c-k>', ':wincmd k<cr>', true)
nmap('<c-l>', ':wincmd l<cr>', true)

tmap('<c-h>', exit_term..':wincmd h<cr>', true)
tmap('<c-j>', exit_term..':wincmd j<cr>', true)
tmap('<c-k>', exit_term..':wincmd k<cr>', true)
tmap('<c-l>', exit_term..':wincmd l<cr>', true)

-- Create and remove split windows
nmap('<leader><leader>', ':vertical split<cr>')
nmap('<leader><cr>', ':split<cr>')
nmap('<leader>t', ':terminal<cr>')
nmap('<leader>w', ':bw<cr>', true)

tmap('<leader><leader>', exit_term..':vertical split<cr>')
tmap('<leader><cr>', exit_term..':split<cr>')
tmap('<leader>t', exit_term..':terminal<cr>')
tmap('<leader>w', exit_term..':bw!<cr>', true)
