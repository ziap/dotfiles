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
    
    on_attach = function(client, bufnr)
      if client.server_capabilities.documentFormattingProvider then
        autocmd({ "BufWritePre" }, {
          pattern = { "<buffer>" },
          callback = vim.lsp.buf.formatting_seq_sync
        })
      end

      local opts = { buffer = bufnr }
      vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
      vim.keymap.set({ 'n', 'v' }, '<leader>c', vim.lsp.buf.code_action, opts)
    end
  }
end
