vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

local opts = {
	noremap = true,
	silent = true,
}

vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

-- Mini Files
vim.keymap.set("n", "<leader>e", function()
	require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
end, { desc = "File Explorer" })
