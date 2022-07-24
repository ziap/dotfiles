" Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
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
let g:airline_left_sep = "\uE0B8"
let g:airline_right_sep = "\uE0BA"
