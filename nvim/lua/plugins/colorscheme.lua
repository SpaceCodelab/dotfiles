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
		end,
	}, 

}
