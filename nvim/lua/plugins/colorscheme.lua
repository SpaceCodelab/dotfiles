function ColorMyPencils(color)
	color = color or "darkrose"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
	{
		"water-sucks/darkrose.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("darkrose").setup({
				styles = { bold = true, italic = true, underline = true },
			})
            ColorMyPencils()
			vim.cmd.colorscheme("darkrose")
		end,
	}, 
    --[[{
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,

    opts = {
      variant = "auto",
      dark_variant = "moon",

      styles = {
        italic = false,
      },
    },

    config = function(_, opts)
      require("rose-pine").setup(opts)
      ColorMyPencils()
    end,
  },]]
}
