local null_ls = require('null-ls')

-- setup prettier, opinionated formatter for js, ts, css, html, and more
-- use prettierd for better performance
-- cli_options are active when :Prettier is called or there is no .prettierrc file
require('prettier').setup({
  bin = 'prettierd',
  cli_options = {
    arrow_parens = "always",
    bracket_spacing = true,
    bracket_same_line = false,
    embedded_language_formatting = "auto",
    end_of_line = "lf",
    html_whitespace_sensitivity = "css",
    -- jsx_bracket_same_line = false,
    jsx_single_quote = false,
    print_width = 80,
    prose_wrap = "preserve",
    quote_props = "as-needed",
    semi = true,
    single_attribute_per_line = false,
    single_quote = false,
    tab_width = 2,
    trailing_comma = "es5",
    use_tabs = false,
    vue_indent_script_and_style = false,
    config_precendence = "prefer-file"
  },
})

-- use prettierd as a source to format on save
null_ls.setup({
  debug = true,
  sources = {
    null_ls.builtins.formatting.prettierd
  },
  on_attach = function(client, bufnr)
  if client.resolved_capabilities.document_formatting then
    -- vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.formatting_sync()<CR>")
    -- vim.cmd("nnoremap <silent><buffer> <Leader>f :Prettier<CR>")

    -- use vim.lsp.buf.formatting_sync() instead of vim.lsp.buf.formatting
    -- to correctly save + format on a single write
    vim.cmd("nnoremap <silent><buffer> <Leader>fx :lua vim.lsp.buf.formatting_sync()<CR>")

    -- format on save
    vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting_sync()")
    -- vim.cmd("autocmd BufWritePost <buffer> :Prettier")
  end

  if client.resolved_capabilities.document_range_formatting then
    vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
  -- vim.cmd("xnoremap <silent><buffer> <Leader>f :Prettier<CR>")
  end
end,
})

-- autopair for mutiple characters
require('nvim-autopairs').setup({
  disable_filetype = { 'vim' },
})

-- treesitter-based syntax highlighting
-- autoclose and rename html tags with nvim-ts-autotag
local treesitter = require('nvim-treesitter.configs')
treesitter.setup {
  highlight = {
    enable = true
  },
  autotag = {
    enable = true,
  },
  indent = {
    enable = true
  }
}
