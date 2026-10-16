-- Appearance
vim.opt.guicursor = ""
vim.opt.termguicolors = true
vim.opt.cursorline = true

vim.g.netrw_banner = 0

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.list = false

-- better yanking
vim.opt.clipboard = "unnamedplus"
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Editing
vim.opt.colorcolumn = "80"
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Files / undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Scrolling
vim.opt.scrolloff = 10

-- Performance
vim.opt.updatetime = 50

-- File names
vim.opt.isfname:append("@-@")

-- Floating windows / completion
vim.opt.pumblend = 0
vim.opt.winblend = 0

vim.keymap.set("n", "<leader>t", ":vsplit | terminal<CR>")
vim.opt.splitright = true

-- snippets
vim.cmd([[
    iabbrev @@ your@gmail.com
]])

-- move lines around
vim.keymap.set("n", "<C-j>", ":m .+1<CR>>==")
vim.keymap.set("n", "<C-k>", ":m .-2<CR>>==")

-- execute files
vim.keymap.set("n", "<leader>ecp", ":w<CR>:!g++ -o %:r && ./%:r<CR>")
