return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("obsidian").setup({
      workspaces = {
        {
          name = "personal",
          path = "~/vaults/personal",
        },
      },

      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },

      follow_url_func = function(url)
        -- vim.fn.jobstart({ "open", url }) -- Mac OS
        vim.ui.open(url) -- need Neovim 0.10.0+
      end,

      ---@param spec { id: string, dir: obsidian.Path, title: string|? }
      ---@return string|obsidian.Path The full path to the new note.
      note_path_func = function(spec)
        -- This is equivalent to the default behavior.
        local path = spec.dir / tostring(spec.title)
        return path:with_suffix(".md")
      end,

      daily_notes = {
        folder = "/2. (A)reas/Journal/",
      },
    })

    vim.keymap.set(
      "n",
      "<leader>oc",
      "<cmd>lua require('obsidian').util.toggle_checkbox()<CR>",
      { desc = "Obsidian Check Checkbox" }
    )
    vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTemplate<CR>", { desc = "[T]emplate" })
    vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianOpen<CR>", { desc = "[O]pen in Obsidian App" })
    vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>", { desc = "[B]acklinks" })
    vim.keymap.set("n", "<leader>ol", "<cmd>ObsidianLinks<CR>", { desc = "[L]inks" })
    vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "[N]ew Note" })
    vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<CR>", { desc = "[S]earch Obsidian (grep)" })
    vim.keymap.set("n", "<leader>oq", "<cmd>ObsidianQuickSwitch<CR>", { desc = "[Q]uick Switch" })
    vim.keymap.set("n", "<leader>od", "<cmd>ObsidianToday<CR>", { desc = "[D]aily Note" })
  end,
}
