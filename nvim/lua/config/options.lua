-- Appearance
vim.opt.guicursor = ""
vim.opt.termguicolors = true
vim.opt.cursorline = true

vim.g.netrw_banner = 0

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
vim.opt.wrap = false
vim.opt.colorcolumn = "80"

-- Files / undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Scrolling
vim.opt.scrolloff = 8

-- Performance
vim.opt.updatetime = 50

-- File names
vim.opt.isfname:append("@-@")

-- Floating windows / completion
vim.opt.pumblend = 0
vim.opt.winblend = 0
