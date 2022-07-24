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
nmap('<leader>f', ':Telescope find_files hidden=true<cr>')
nmap('<leader>g', ':Telescope live_grep<cr>')
nmap('<leader>b', ':Telescope buffers<cr>')
nmap('<leader>h', ':Telescope help_tags<cr>')
nmap('<leader><leader>', ':vertical split<cr>')

-- Move around split windows
nmap('<c-h>', ':wincmd h<cr>')
nmap('<c-j>', ':wincmd j<cr>')
nmap('<c-k>', ':wincmd k<cr>')
nmap('<c-l>', ':wincmd l<cr>')
