" lspsaga keymaps"
nnoremap <silent>K :Lspsaga hover_doc<cr>
nnoremap <silent>gh :Lspsaga lsp_finder<cr>
nnoremap <silent><C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>
nnoremap <silent><C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>
nnoremap <silent>gr :Lspsaga rename<cr>

let mapleader = " "
nnoremap <leader>f <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>

" Split panes
set splitright
set splitbelow

" Move between panes
nnoremap <silent> <c-k> <cmd>wincmd k<cr>
nnoremap <silent> <c-j> <cmd>wincmd j<cr>
nnoremap <silent> <c-h> <cmd>wincmd h<cr>
nnoremap <silent> <c-l> <cmd>wincmd l<cr>
nnoremap <leader><leader> <cmd>vertical split<cr><cmd>Telescope find_files hidden=true<cr>
