-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- use jk to exit insert mode
vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- save file override
vim.keymap.set("n", "<leader>a", "<cmd>update<CR><esc>", { desc = "Write file" })

-- clear search highlights
vim.keymap.set("n", "<ESC>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x')
