return {
  -- Disable community snippets
  { "rafamadriz/friendly-snippets", enabled = false },

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
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },

  -- obsidian
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    ft = "markdown",
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "~/vaults/personal",
        },
        {
          name = "work",
          path = "~/vaults/work",
        },
      },

      templates = {
        folder = "Templates",
      },

      note_path_func = function(spec)
        local path = spec.dir / tostring(spec.title or spec.id)
        return path:with_suffix(".md")
      end,

      daily_notes = {
        folder = "2. Areas/Journal",
        template = "Daily",
      },
    },
    keys = {
      { "<leader>oc", "<cmd>Obsidian toggle_checkbox<CR>", desc = "Obsidian Check Checkbox" },
      { "<leader>ot", "<cmd>Obsidian template<CR>", desc = "Obsidian [T]emplate" },
      { "<leader>oo", "<cmd>Obsidian open<CR>", desc = "Obsidian [O]pen in App" },
      { "<leader>ob", "<cmd>Obsidian backlinks<CR>", desc = "Obsidian [B]acklinks" },
      { "<leader>ol", "<cmd>Obsidian links<CR>", desc = "Obsidian [L]inks" },
      { "<leader>on", "<cmd>Obsidian new<CR>", desc = "Obsidian [N]ew Note" },
      { "<leader>os", "<cmd>Obsidian search<CR>", desc = "Obsidian [S]earch (grep)" },
      { "<leader>oq", "<cmd>Obsidian quick_switch<CR>", desc = "Obsidian [Q]uick Switch" },
      { "<leader>od", "<cmd>Obsidian today<CR>", desc = "Obsidian [D]aily Note" },
    },
  },

  -- blink.cmp keymaps
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
      },
      cmdline = {
        keymap = {
          ["<C-k>"] = { "select_prev", "fallback" },
          ["<C-j>"] = { "select_next", "fallback" },
        },
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
    ---@module "snacks"
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
          filetypes = {
            "html",
            "css",
            "scss",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "svelte",
          },
        },
      },
      setup = {
        tailwindcss = function(_, opts)
          opts.settings = {
            tailwindCSS = {
              experimental = {
                classRegex = {
                  { "cn\\(([^)]*)\\)", "[\"'`]([^\"'`]*)[\"'`]" },
                  { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*)[\"'`]" },
                  { "cx\\(([^)]*)\\)", "[\"'`]([^\"'`]*)[\"'`]" },
                },
              },
            },
          }
        end,
      },
    },
  },

  {
    "chrisgrieser/nvim-early-retirement",
    event = "VeryLazy",
    opts = {
      retirementAgeMins = 5,
    },
  },

  -- neotest vitest adapter
  { "marilari88/neotest-vitest" },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["neotest-vitest"] = {},
      },
    },
  },
}
