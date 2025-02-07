-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Remap extra keys to exit insert mode
vim.keymap.set("i", "jk", "<Esc>", {})
vim.keymap.set("i", "kj", "<Esc>", {})

-- Prevent Q from being sent if accidental capslock is on
vim.keymap.set("n", "Q", "<nop>")

-- Half-page jumping with centered cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
