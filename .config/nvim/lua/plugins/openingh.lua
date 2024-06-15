return {
  "almo7aya/openingh.nvim",
  config = function()
    vim.api.nvim_set_keymap(
      "n",
      "<Leader>gf",
      ":OpenInGHFile <CR>",
      { desc = "Open [G]itHub [F]ile", silent = true, noremap = true }
    )
  end,
}
