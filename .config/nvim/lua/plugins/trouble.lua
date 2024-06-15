return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  opts = {},
  cmd = "Trouble",
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "[X] Open/close trouble list" },
    { "<leader>xq", "<cmd>Trouble qflist toggle<CR>", desc = "Open trouble [Q]uickfix list" },
    { "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "Open trouble [L]ocation list" },
    { "<leader>xt", "<cmd>Trouble todo<CR>", desc = "Open [T]odos in trouble" },
  },
}
