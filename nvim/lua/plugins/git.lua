return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },

		opts = {
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},

			signs_staged = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},

			current_line_blame = false,

			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, {
						buffer = bufnr,
						desc = desc,
					})
				end

				-- Navigation
				map("n", "]h", gs.next_hunk, "Next Git hunk")
				map("n", "[h", gs.prev_hunk, "Previous Git hunk")

				-- Hunk actions
				map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
				map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
				map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")

				-- Buffer actions
				map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
				map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")

				-- Git diff
				map("n", "<leader>hd", gs.diffthis, "Diff this")
				map("n", "<leader>hD", function()
					gs.diffthis("~")
				end, "Diff against HEAD~")

				-- Blame
				map("n", "<leader>hb", gs.blame_line, "Blame line")
				map("n", "<leader>hB", function()
					gs.blame_line({ full = true })
				end, "Full blame")

				-- Toggle current-line blame
				map("n", "<leader>tb", gs.toggle_current_line_blame, "Toggle line blame")

				-- Visual mode
				map("v", "<leader>hs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "Stage selected hunk")

				map("v", "<leader>hr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, "Reset selected hunk")
			end,
		},
	},
}
