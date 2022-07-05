local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, 
  }, {
    { name = 'buffer' }
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' }
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

local lsconf = { 
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

local lspconfig = require'lspconfig'
lspconfig.pyright.setup(lsconf)
lspconfig.clangd.setup(lsconf)
lspconfig.html.setup(lsconf)
lspconfig.cssls.setup(lsconf) 
lspconfig.tsserver.setup(lsconf)
lspconfig.emmet_ls.setup(lsconf)

require'lspsaga'.init_lsp_saga{}
require'nvim-autopairs'.setup{}
require'nvim-treesitter.configs'.setup{
  ensure_installed = { "python", "lua", "c", "cpp", "rust", "javascript", "html", "css", "markdown" },
    
  sync_install = false,

  highlight = { enable = true }
}

require'nvim-tree'.setup{}

require'bufferline'.setup{
  options = {
    -- NvimTree supports
    offsets = {
      {
        filetype = "NvimTree",
        text = "Explorer", 
        highlight = "Directory",
        text_align = "left"
      }
    },

    -- Error message
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end
  }
}
