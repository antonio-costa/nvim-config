-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "oo", "o<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "oi", "o", { noremap = true, silent = true })
vim.keymap.set("n", "Oo", "O<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "Oi", "O", { noremap = true, silent = true })
