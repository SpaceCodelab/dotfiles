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
			--[[local starter = require("mini.starter")
			starter.setup({
				header = table.concat({
					"███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
					"████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
					"██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
					"██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
					"██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
					"╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
					"",
					"    " .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch,
				}, "\n"),
				items = {
					starter.sections.builtin_actions(),
					{ name = "Find files", action = "Telescope find_files", section = "Telescope" },
					{ name = "Grep", action = "Telescope live_grep", section = "Telescope" },
					{ name = "Recent files", action = "Telescope oldfiles", section = "Recent" },
					{ name = "Config", action = "lua vim.cmd('e ~/.config/nvim/init.lua')", section = "Config" },
					{ name = "Lazy", action = "Lazy", section = "Tools" },
					{ name = "Mason", action = "Mason", section = "Tools" },
				},
				content_hooks = {
					starter.gen_hook.adding_bullet("· "),
					starter.gen_hook.aligning("center", "center"),
					starter.gen_hook.padding(0, 2),
				},
				footer = "Press <CR> to select an item",
			})]]
		end,
	},
}
