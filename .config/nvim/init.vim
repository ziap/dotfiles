" +-------+
" | VimRC |
" +-------+

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

lua require'plugins'

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
