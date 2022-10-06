local null_ls = require('null-ls')

-- setup prettier, opinionated formatter for js, ts, css, html, and more
-- use prettierd for better performance
-- cli_options are active when :Prettier is called
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
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
        vim.lsp.buf.formatting_sync()
      end,
      })
    end
  end,
})

-- autopair for mutiple characters
require('nvim-autopairs').setup({
  disable_filetype = { 'vim' },
})

-- treesitter-based syntax highlighting
-- for renaming tags in tsx, make sure to do :TSInstall tsx
local treesitter = require('nvim-treesitter.configs')
treesitter.setup {
  highlight = {
    enable = true
  },
  -- autoclose and rename html tags with nvim-ts-autotag
  autotag = {
    enable = true,
  },
  -- avoid weird indent errors after creating new line
  indent = {
    enable = true
  }
}
