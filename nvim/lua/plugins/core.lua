return {
	{
		"norcalli/nvim-colorizer.lua",
		init = function()
			-- Back-compat shim. colorizer's lua/colorizer/nvim.lua:96 still calls
			-- vim.tbl_flatten, which Neovim 0.11 deprecated and 0.12 dropped from
			-- api.txt. The function still works but warns on every startup.
			-- Restored here with the stock implementation; remove once the plugin
			-- is updated to use a table.concat-based replacement.
			vim.tbl_flatten = function(t)
				local result = {}
				local function _tbl_flatten(_t)
					for i = 1, #_t do
						local v = _t[i]
						if type(v) == "table" then
							_tbl_flatten(v)
						elseif v then
							result[#result + 1] = v
						end
					end
				end
				_tbl_flatten(t)
				return result
			end
		end,
		config = function()
			require("colorizer").setup(nil, {
				rgb_fn = true,
				hsl_fn = true,
			})
		end,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"zk",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"Zk",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},
}
