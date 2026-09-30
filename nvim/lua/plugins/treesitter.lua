-- Treesitter: syntax parsing, highlighting and textobjects
return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",

		init = function()
			local parsers = {
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
			}

			local group = vim.api.nvim_create_augroup("Treesitter", { clear = true })

			-- Start Treesitter highlighting automatically
			vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
				group = group,

				callback = function()
					if vim.bo.buftype ~= "" then
						return
					end

					pcall(vim.treesitter.start, 0)
				end,
			})

			-- Install parsers after Neovim has loaded
			vim.api.nvim_create_autocmd("User", {
				group = group,
				pattern = "VeryLazy",
				once = true,

				callback = function()
					require("nvim-treesitter").install(parsers)
				end,
			})
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
