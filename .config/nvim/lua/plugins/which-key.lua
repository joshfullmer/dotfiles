return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    require("which-key").setup()

    require("which-key").add({
      { "<leader>b", group = "[B]uffer" },
      { "<leader>b_", hidden = true },
      { "<leader>c", group = "[C]ode" },
      { "<leader>c_", hidden = true },
      { "<leader>e", group = "[E]xplorer" },
      { "<leader>e_", hidden = true },
      { "<leader>f", group = "[F]ind" },
      { "<leader>f_", hidden = true },
      { "<leader>g", group = "[G]itHub" },
      { "<leader>g_", hidden = true },
      { "<leader>j", group = "[J]ump" },
      { "<leader>j_", hidden = true },
      { "<leader>l", group = "[L]SP" },
      { "<leader>l_", hidden = true },
      { "<leader>n", group = "[N]ext" },
      { "<leader>n_", hidden = true },
      { "<leader>p", group = "[P]revious" },
      { "<leader>p_", hidden = true },
      { "<leader>r", group = "[R]ename" },
      { "<leader>r_", hidden = true },
      { "<leader>s", group = "[S]plit" },
      { "<leader>s_", hidden = true },
      { "<leader>x", group = "[X] Diagnostics" },
      { "<leader>x_", hidden = true },
    })
  end,
}
