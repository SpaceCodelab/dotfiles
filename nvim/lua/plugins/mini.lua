return {
	{
		"echasnovski/mini.nvim",
		version = false,

		config = function()
			-- Comments
			require("mini.comment").setup()

			-- Move text
			require("mini.move").setup({
				mappings = {
					left = "<M-h>",
					right = "<M-l>",
					down = "<M-j>",
					up = "<M-k>",

					line_left = "<M-h>",
					line_right = "<M-l>",
					line_down = "<M-j>",
					line_up = "<M-k>",
				},
			})

			-- Auto pairs
			require("mini.pairs").setup()

			-- Notifications
			require("mini.notify").setup({
				lsp_progress = {
					enable = false,
				},
			})

			-- Startup screen
			require("mini.starter").setup({
				header = "Neovim",
			})
		end,
	},
}
