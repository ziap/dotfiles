local autocmd = vim.api.nvim_create_autocmd

-- For ease of adding servers
local servers = {
  'pyright',
  'clangd',
  'html',
  'cssls',
  'tsserver',
  'emmet_ls',
  'rust_analyzer'
}

for i, name in ipairs(servers) do
  require'lspconfig'[name].setup{ 
    -- Enable completion
    capabilities = require'cmp_nvim_lsp'.default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    
    -- Formatting on save
    on_attach = function(client, bufnr)
      if client.server_capabilities.documentFormattingProvider then
        autocmd({ "BufWritePre" }, {
          pattern = { "<buffer>" },
          callback = vim.lsp.buf.formatting_seq_sync
        })
      end
    end
  }
end

require'lspsaga'.init_lsp_saga{
  border_style = 'rounded',
  finder_action_keys = {
    open = '<cr>',
    vsplit = 'v',
    split = 'h',
    quit = 'q',
    scroll_down = '<C-f>',
    scroll_up = '<C-b>', -- quit can be a table
  }
}
