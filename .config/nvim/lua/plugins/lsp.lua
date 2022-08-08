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
    capabilities = require'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    
    -- Formatting on save
    on_attach = function(client, bufnr)
      if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
        vim.api.nvim_command [[augroup END]]
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
