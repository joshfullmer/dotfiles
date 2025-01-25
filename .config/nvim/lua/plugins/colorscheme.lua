return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "moon",
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = { italic = true },
        },
      })

      vim.cmd("colorscheme tokyonight-moon")
    end,
  },
}
