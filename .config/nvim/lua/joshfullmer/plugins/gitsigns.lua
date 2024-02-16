return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local gs = require("gitsigns")

		gs.setup()

		local keymap = vim.keymap

		keymap.set("n", "<leader>hs", gs.stage_hunk, { desc = "Stage hunk" })
		keymap.set("n", "<leader>hr", gs.reset_hunk)
		keymap.set("v", "<leader>hs", function()
			gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end)
		keymap.set("v", "<leader>hr", function()
			gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end)
		keymap.set("n", "<leader>hS", gs.stage_buffer)
		keymap.set("n", "<leader>hu", gs.undo_stage_hunk)
		keymap.set("n", "<leader>hR", gs.reset_buffer)
		keymap.set("n", "<leader>hp", gs.preview_hunk)
		keymap.set("n", "<leader>hb", function()
			gs.blame_line({ full = true })
		end)
		keymap.set("n", "<leader>tb", gs.toggle_current_line_blame)
		keymap.set("n", "<leader>hd", gs.diffthis)
		keymap.set("n", "<leader>hD", function()
			gs.diffthis("~")
		end)
		keymap.set("n", "<leader>td", gs.toggle_deleted)
	end,
}
