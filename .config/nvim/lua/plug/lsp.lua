local autocmd = vim.api.nvim_create_autocmd

-- For ease of adding servers
local servers = {
  'pyright',
  'clangd',
  'html',
  'cssls',
  'ts_ls',
  'emmet_ls',
  'rust_analyzer'
}

for i, name in ipairs(servers) do
  require'lspconfig'[name].setup{ 
    -- Enable completion
    capabilities = require'cmp_nvim_lsp'.default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  }
end
