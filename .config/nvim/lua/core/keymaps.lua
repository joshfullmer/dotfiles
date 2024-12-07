-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- save file override
keymap.set("n", "<leader>w", "<cmd>update<CR><esc>", { desc = "[W]rite file" })

-- clear search highlights
keymap.set("n", "<ESC>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- exit terminal mode
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "[+] Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "[-] Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "[S]plit window [V]ertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "[S]plit window [H]orizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make [S]plits [E]qual size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current [S]plit [X]" }) -- close current split window

-- buffer management
keymap.set("n", "<leader>bn", ":bnext<cr>", { desc = "[N]ext buffer" })
keymap.set("n", "<leader>bp", ":bprev<cr>", { desc = "[P]revious buffer" })
keymap.set("n", "<leader>bD", ":%bd|e#|bd#<cr>", { desc = "[X] Close all but current buffer", silent = true })
