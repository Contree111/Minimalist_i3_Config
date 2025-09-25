require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local opt = vim.opt

opt.tabstop = 4
opt.shiftwidth = 4

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>v", ":make<CR>")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
