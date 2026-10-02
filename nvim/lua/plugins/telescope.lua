-- Telescope: fuzzy finding and file navigation
return {
	-- File icons
	{
		"nvim-tree/nvim-web-devicons",
		opts = {},
	},

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		version = "*",

		dependencies = {
			"nvim-lua/plenary.nvim",

			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},

		config = function()
			require("telescope").setup({})

			-- Load fzf-native extension
			pcall(require("telescope").load_extension, "fzf")

			local preview_utils = require("telescope.previewers.utils")

			preview_utils.ts_highlighter = function(bufnr, ft)
				local lang = vim.treesitter.language.get_lang(ft) or ft

				if not lang or lang == "" then
					return false
				end

				return pcall(vim.treesitter.start, bufnr, lang)
			end
		end,

		keys = {
			{
				"<leader>ff",
				"<cmd>Telescope find_files<cr>",
				desc = "Find Files",
			},

			{
				"<leader>gf",
				"<cmd>Telescope git_files<cr>",
				desc = "Git Files",
			},

			{
				"<leader>pws",
				function()
					local word = vim.fn.expand("<cword>")
					require("telescope.builtin").grep_string({
						search = word,
					})
				end,
				desc = "Grep Word",
			},

			{
				"<leader>pWs",
				function()
					local word = vim.fn.expand("<cWORD>")
					require("telescope.builtin").grep_string({
						search = word,
					})
				end,
				desc = "Grep WORD",
			},

			{
				"<leader>ps",
				function()
					require("telescope.builtin").grep_string({
						search = vim.fn.input("Grep > "),
					})
				end,
				desc = "Grep String",
			},

			{
				"<leader>vh",
				"<cmd>Telescope help_tags<cr>",
				desc = "Help Tags",
			},
		},
	},
}
