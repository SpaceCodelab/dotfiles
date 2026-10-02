return {
	{
		"neovim/nvim-lspconfig",

		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Completion
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",

			-- Snippets
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",

			-- LSP progress
			"j-hui/fidget.nvim",
		},

		config = function()
			local cmp = require("cmp")
			local cmp_lsp = require("cmp_nvim_lsp")

			----------------------------------------------------------------
			-- Mason
			----------------------------------------------------------------

			require("mason").setup()

			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"gopls",
					"vtsls",
					"tailwindcss",
					"basedpyright",
					"ruff",
				},
			})
			vim.lsp.enable("stylua", false)

			----------------------------------------------------------------
			-- LSP capabilities
			----------------------------------------------------------------

			vim.lsp.config("*", {
				capabilities = cmp_lsp.default_capabilities(),
			})

			----------------------------------------------------------------
			-- C / C++
			----------------------------------------------------------------

			vim.lsp.config("clangd", {
				cmd = {
					"clangd",
					"--background-index",
				},

				init_options = {
					clangdFileStatus = true,
					fallbackFlags = {
						"-std=c++20",
						"-Wall",
					},
				},
			})

			vim.lsp.enable("clangd")

			----------------------------------------------------------------
			-- Python
			----------------------------------------------------------------

			vim.lsp.config("basedpyright", {
				settings = {
					basedpyright = {
						analysis = {
							typeCheckingMode = "standard",
						},
					},
				},
			})

			vim.lsp.enable("basedpyright")

			vim.lsp.config("ruff", {
				init_options = {
					settings = {
						args = {
							"--config",
							"line-length = 88",
						},
					},
				},
			})

			vim.lsp.enable("ruff")
			----------------------------------------------------------------
			-- Lua
			----------------------------------------------------------------

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},

						diagnostics = {
							globals = {
								"vim",
							},
						},

						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},

						-- Formatting is handled by Conform + Stylua
						format = {
							enable = false,
						},
					},
				},
			})

			vim.lsp.enable("lua_ls")

			----------------------------------------------------------------
			-- Rust
			----------------------------------------------------------------

			vim.lsp.enable("rust_analyzer")

			----------------------------------------------------------------
			-- Go
			----------------------------------------------------------------

			vim.lsp.enable("gopls")

			----------------------------------------------------------------
			-- TypeScript / JavaScript
			----------------------------------------------------------------

			vim.lsp.enable("vtsls")

			----------------------------------------------------------------
			-- Tailwind
			----------------------------------------------------------------

			vim.lsp.enable("tailwindcss")

			----------------------------------------------------------------
			-- Fidget
			----------------------------------------------------------------

			require("fidget").setup()

			----------------------------------------------------------------
			-- Completion
			----------------------------------------------------------------

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},

				mapping = cmp.mapping.preset.insert({
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-n>"] = cmp.mapping.select_next_item(),

					["<C-y>"] = cmp.mapping.confirm({
						select = true,
					}),

					["<C-Space>"] = cmp.mapping.complete(),
				}),

				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				},
			})

			----------------------------------------------------------------
			-- Diagnostics
			----------------------------------------------------------------

			vim.diagnostic.config({
				float = {
					focusable = false,
					style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			})
		end,
	},

	--------------------------------------------------------------------
	-- External formatters / tools
	--------------------------------------------------------------------

	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		dependencies = {
			"williamboman/mason.nvim",
		},

		opts = {
			ensure_installed = {
				"stylua",
				"prettier",
			},
		},
	},
}
