return {
	"stevearc/conform.nvim",

	event = { "BufWritePre" },

	opts = {
		format_on_save = {
			timeout_ms = 5000,
			lsp_format = "fallback",
		},

		formatters_by_ft = {
			c = { "clang-format" },
			cpp = { "clang-format" },
			rust = { "rustfmt" },
			lua = { "stylua" },
			go = { "gofmt" },
			odin = { "odinfmt" },
			json = { "prettier" },
			elixir = { "mix" },
		},

		formatters = {
			["clang-format"] = {
				prepend_args = {
					"-style=file",
					"-fallback-style=LLVM",
				},
			},
		},
	},

	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ bufnr = 0 })
			end,
			desc = "Format buffer",
		},
	},
}
