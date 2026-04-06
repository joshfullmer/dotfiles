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
      { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
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
      { "<leader>ot", "<cmd>Obsidian template<CR>",        desc = "Obsidian [T]emplate" },
      { "<leader>oo", "<cmd>Obsidian open<CR>",            desc = "Obsidian [O]pen in App" },
      { "<leader>ob", "<cmd>Obsidian backlinks<CR>",       desc = "Obsidian [B]acklinks" },
      { "<leader>ol", "<cmd>Obsidian links<CR>",           desc = "Obsidian [L]inks" },
      { "<leader>on", "<cmd>Obsidian new<CR>",             desc = "Obsidian [N]ew Note" },
      { "<leader>os", "<cmd>Obsidian search<CR>",          desc = "Obsidian [S]earch (grep)" },
      { "<leader>oq", "<cmd>Obsidian quick_switch<CR>",    desc = "Obsidian [Q]uick Switch" },
      { "<leader>od", "<cmd>Obsidian today<CR>",           desc = "Obsidian [D]aily Note" },
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
      inlay_hints = { enabled = false },
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
          settings = {
            tailwindCSS = {
              experimental = {
                -- Match Tailwind classes inside cn(), cva(), and cx() utility functions
                classRegex = {
                  { "cn\\(([^)]*)\\)",  "[\"'`]([^\"'`]*)[\"'`]" },
                  { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*)[\"'`]" },
                  { "cx\\(([^)]*)\\)",  "[\"'`]([^\"'`]*)[\"'`]" },
                },
              },
            },
          },
          -- Runs before the language server initializes for each workspace root.
          -- Replaces the default before_init from lspconfig (which only sets tabSize),
          -- so we replicate that logic here as well.
          before_init = function(params, config)
            -- Replicate default lspconfig before_init: sync editor tabSize
            if not config.settings then
              config.settings = {}
            end
            if not config.settings.editor then
              config.settings.editor = {}
            end
            if not config.settings.editor.tabSize then
              config.settings.editor.tabSize = vim.lsp.util.get_effective_tabstop()
            end

            -- Tailwind v4 auto-discovery can fail in monorepos where build output
            -- dirs (dist/, .svelte-kit/) contain copies of the CSS entry point.
            -- The server finds multiple files with `@import 'tailwindcss'`, picks
            -- one from a build dir, fails to resolve its imports, and silently
            -- gives up. To fix this, we scan only src/ for the entry point and
            -- explicitly tell the server which file to use via configFile.
            local root_dir = vim.uri_to_fname(params.rootUri)
            local css_files = vim.fn.globpath(root_dir .. "/src", "**/*.css", false, true)
            for _, file in ipairs(css_files) do
              for _, line in ipairs(vim.fn.readfile(file, "", 10)) do
                if line:match("@import%s+['\"]tailwindcss['\"]") then
                  config.settings.tailwindCSS = config.settings.tailwindCSS or {}
                  config.settings.tailwindCSS.experimental = config.settings.tailwindCSS.experimental or {}
                  config.settings.tailwindCSS.experimental.configFile = file:sub(#root_dir + 2)
                  return
                end
              end
            end
          end,
        },
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

  -- diffview - git diff viewer
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>",          desc = "Diffview Open" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview File History" },
      { "<leader>gH", "<cmd>DiffviewFileHistory<cr>",   desc = "Diffview Branch History" },
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
