require'nvim-treesitter'.setup {
  ensure_installed = {},
  auto_install = false,
  highlight = { enable = true },
  indent = { enable = true },
}

vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    local buf, filetype = args.buf, args.match

    local language = vim.treesitter.language.get_lang(filetype)
    if not language then
      return
    end

    -- check if parser exists and load it
    if not vim.treesitter.language.add(language) then
      return
    end

    -- enables syntax highlighting and other treesitter features
    vim.treesitter.start(buf, language)
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
