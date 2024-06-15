return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    require("which-key").setup()

    require("which-key").register({
      ["<leader>b"] = { name = "[B]uffer", _ = "which_key_ignore" },
      ["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
      ["<leader>e"] = { name = "[E]xplorer", _ = "which_key_ignore" },
      ["<leader>g"] = { name = "[G]itHub", _ = "which_key_ignore" },
      ["<leader>l"] = { name = "[L]SP", _ = "which_key_ignore" },
      ["<leader>f"] = { name = "[F]ind", _ = "which_key_ignore" },
      ["<leader>n"] = { name = "[N]ext", _ = "which_key_ignore" },
      ["<leader>p"] = { name = "[P]revious", _ = "which_key_ignore" },
      ["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
      ["<leader>s"] = { name = "[S]plit", _ = "which_key_ignore" },
      ["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
      ["<leader>x"] = { name = "[X] Diagnostics", _ = "which_key_ignore" },
    })
  end,
}
