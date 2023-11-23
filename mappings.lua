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
    ["<C-w>h"] = { "<Cmd>wincmd h<CR>", "Go to the left window" },
    ["<C-w>j"] = { "<Cmd>wincmd j<CR>", "Go to the down window" },
    ["<C-w>k"] = { "<Cmd>wincmd k<CR>", "Go to the up window" },
    ["<C-w>l"] = { "<Cmd>wincmd l<CR>", "Go to the right window" },
  },
}

-- more keybinds!

M.flash = {}

return M
