-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- new lines
map("n", "oo", "o<Esc>", { noremap = true, silent = true })
map("n", "oi", "o", { noremap = true, silent = true })
map("n", "Oo", "O<Esc>", { noremap = true, silent = true })
map("n", "Oi", "O", { noremap = true, silent = true })
