return {
  -- colorscheme
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
  },

  -- neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
        },
      },
      window = {
        position = "right",
      },
    },
  },

  -- vim-tmux-navigator
  {
    "christoomey/vim-tmux-navigator",
    event = "BufReadPre",
  },

  -- obsidian
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    -- ft = "markdown",
    event = {
      "BufReadPre " .. vim.fn.expand("~") .. "/vaults/personal/*.md",
      "BufNewFile " .. vim.fn.expand("~") .. "/vaults/personal/*.md",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("obsidian").setup({
        ui = { enable = false },
        workspaces = {
          {
            name = "personal",
            path = "~/vaults/personal",
          },
        },

        templates = {
          folder = "Templates",
        },

        completion = {
          nvim_cmp = true,
          -- TODO: Uncomment when https://github.com/epwalsh/obsidian.nvim/pull/817 is merged
          -- blink = true,
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

        wiki_link_func = "prepend_note_path",

        daily_notes = {
          folder = "/2. Areas/Journal/",
          template = "Daily",
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
  },
  {
    "saghen/blink.cmp",
    dependencies = {
      { "epwalsh/obsidian.nvim", "saghen/blink.compat" },
    },
    opts = {
      keymap = {
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
      },
      sources = {
        compat = { "obsidian", "obsidian_new", "obsidian_tags" },
      },
    },
  },

  -- Disable character limit in markdown
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          args = { "--config", "~/.markdownlint.yaml", "--" },
        },
      },
    },
  },

  -- Show all hidden files by default
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      picker = {
        sources = {
          files = { hidden = true },
          grep = { hidden = true },
          explorer = { layout = { position = "right" }, hidden = true },
        },
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {
          settings = {
            tailwindCSS = {
              experimental = {
                classRegex = {
                  { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
                  { "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                  { "cn\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
                  { "([a-zA-Z0-9\\-:]+)" },
                },
              },
            },
          },
        },
      },
    },
  },
}
