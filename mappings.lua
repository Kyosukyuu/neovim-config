---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>%"] = { "ggVG", "select all", {} },
    ["<leader>h"] = { "^", "go to first non-blank character of line", {} },
    ["<leader>l"] = { "$", "go to last character of line", {} },
  },
  v = {
    [">"] = { ">gv", "indent" },
    ["J"] = { ":m '>+1<CR>gv=gv", "move selection down" },
    ["K"] = { ":m '<-2<CR>gv=gv", "move selection up" },
  },
  t = {
    ["<ESC>"] = { "<C-\\><C-n>", "escape terminal" },
  },
}

-- more keybinds!

M.flash = {}

return M
