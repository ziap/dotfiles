function bind(mode)
  return function(lhs, rhs, silent)
    local options = {
      noremap = true,
      silent = silent or false
    }
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
  end
end

local nmap = bind('n')

nmap('K', ':Lspsaga hover_doc<cr>', true)
nmap('gh', ':Lspsaga lsp_finder<cr>', true)
nmap('gr', ':Lspsaga rename<cr>', true)

vim.g.mapleader = ' '
nmap('<leader>f', ':Telescope find_files<cr>')
nmap('<leader>g', ':Telescope live_grep<cr>')
nmap('<leader>b', ':Telescope buffers<cr>')
nmap('<leader>h', ':Telescope help_tags<cr>')
nmap('<leader>e', ':Telescope file_browser<cr>')

-- Move around split windows
nmap('<c-h>', ':wincmd h<cr>', true)
nmap('<c-j>', ':wincmd j<cr>', true)
nmap('<c-k>', ':wincmd k<cr>', true)
nmap('<c-l>', ':wincmd l<cr>', true)

-- Create and remove split windows
nmap('<leader><leader>', ':vertical split<cr>')
nmap('<leader><cr>', ':split<cr>')
nmap('<c-w>', ':bw<cr>', true)
