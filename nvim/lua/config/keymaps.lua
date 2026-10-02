vim.keymap.set("n", "<leader>cd", vim.cmd.Ex, { desc = "Open netrw" })

local opts = {
	noremap = true,
	silent = true,
}

-- Diagnostic keymaps (global)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, vim.tbl_extend("force", opts, { desc = "Previous diagnostic" }))

vim.keymap.set("n", "]d", vim.diagnostic.goto_next, vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))
