return {
	"sindrets/diffview.nvim",
	dependencies = {
		{ "TimUntersberger/neogit", config = { disable_commit_confirmation = true } },
	},
	keys = {
		{ "<C-g>", "<CMD>DiffviewOpen<CR>", mode = { "n", "i", "v" } },
	},
	config = {
		keymaps = {
			view = {
				["<C-g>"] = "<CMD>DiffviewClose<CR>",
				["c"] = "<CMD>Neogit commit<CR>",
			},
			file_panel = {
				["<C-g>"] = "<CMD>DiffviewClose<CR>",
				["c"] = "<CMD>Neogit commit<CR>",
			},
		},
		file_panel = {
			win_config = {
				position = "right",
			},
		},
	},
}
