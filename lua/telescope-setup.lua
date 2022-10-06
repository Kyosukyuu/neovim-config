local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

telescope.setup {
  defaults = {
    color_devicons = true,
    prompt_prefix = '$ ',
    file_ignore_patterns = { '^.git/' },
    mappings = {
      i = {
        ['<esc>'] = actions.close,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
      },
    },
  },
}

telescope.load_extension('fzy_native')
telescope.load_extension('file_browser')

local M = {}

M.search_dotfiles = function()
    require('telescope.builtin').find_files({
        prompt_title = "<.dotfiles>",
        cwd = '~/.dotfiles',
        hidden = true
    })
end
vim.api.nvim_set_keymap('n', '<Leader>df', ':lua require\'telescope-setup\'.search_dotfiles()<Cr>', {noremap = true, silent = true})

return M
