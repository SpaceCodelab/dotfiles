-- Trouble: diagnostics
return {
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },

		cmd = "Trouble",
		keys = {
			{
				"<leader>tt",
				function()
					require("trouble").toggle("diagnostics")
				end,
				desc = "Toggle diagnostics",
			},

			{
				"<leader>tn",
				function()
					require("trouble").next({ mode = "diagnostics", jump = true })
				end,
				desc = "Next diagnostic",
			},

			{
				"<leader>tp",
				function()
					require("trouble").prev({ mode = "diagnostics", jump = true })
				end,
				desc = "Previous diagnostic",
			},
		},
	},
}
