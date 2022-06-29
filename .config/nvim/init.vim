" Search
set showmatch
set ignorecase
set smartcase
set hlsearch
set incsearch

" Status
set laststatus=2

" Indentation
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set autoindent
set smartindent

" Correctly load plug-ins
filetype plugin indent on
filetype plugin on

" Integration
set mouse=a
set clipboard=unnamedplus
set ttyfast

" Layout
syntax on
set number relativenumber
set cursorline

" Disable backup
set nobackup
set nowritebackup

call plug#begin("~/.vim/plugged")
  " Theming
  Plug 'ellisonleao/gruvbox.nvim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  
  " LSP
  Plug 'neovim/nvim-lspconfig'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/vim-vsnip-integ'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'

  " Treesitter
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  
  " Functionalities
  Plug 'windwp/nvim-autopairs'
  Plug 'windwp/nvim-ts-autotag'
  Plug 'nvim-lua/plenary.nvim'
  
  " File selectior
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'akinsho/bufferline.nvim'
call plug#end()

set splitright
set splitbelow

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set background=dark " or light if you want light mode
colorscheme gruvbox
let g:airline_theme='base16_gruvbox_dark_medium'

lua << EOF
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
EOF

nnoremap <silent>K :Lspsaga hover_doc<CR>
nnoremap <silent>gh :Lspsaga lsp_finder<CR>
nnoremap <silent><C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent><C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
nnoremap <silent>gr :Lspsaga rename<CR>

let mapleader = " "
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>
nnoremap <leader>n <cmd>NvimTreeFocus<cr>
nnoremap <leader>t <cmd>NvimTreeToggle<cr>
nnoremap <leader>] <cmd>BufferLineCycleNext<cr>
nnoremap <leader>[ <cmd>BufferLineCyclePrev<cr>
