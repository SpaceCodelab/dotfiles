-- Treesitter: syntax parsing, highlighting and textobjects
return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		branch = "master",

		opts = {
			ensure_installed = {
				"c",
				"cpp",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"bash",
				"python",
				"rust",
				"go",
				"javascript",
				"typescript",
				"tsx",
				"html",
				"css",
				"json",
				"markdown",
				"markdown_inline",
				"gitignore",
				"odin",
			},
			auto_install = true,
			highlight = { enable = true },
		},

		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		lazy = false,

		config = function()
			require("nvim-treesitter-textobjects").setup({
				select = {
					enable = true,
					lookahead = true,

					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
					},
				},
			})
		end,
	},
}
