-- this file is for colorscheme management
--
-- Keep exactly ONE block uncommented below -- the last one is the active
-- theme. To switch: comment the active block, uncomment the one you want,
-- then restart Neovim.

-- BRIGHTBURN   colorscheme: brightburn
-- return {
--   "erikbackman/brightburn.vim",
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme("brightburn")
--   end,
-- }

-- ABSTRACT-CS   colorscheme: abscs
-- return {
--   "Abstract-IDE/Abstract-cs",
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme("abscs")
--   end,
-- }

-- ALABASTER   colorscheme: alabaster
-- return {
--   "dchinmay2/alabaster.nvim",
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme("alabaster")
--   end,
-- }

-- CYBERDREAM   colorscheme: cyberdream | cyberdream-muted | cyberdream-light
-- return {
--   "scottmckendry/cyberdream.nvim",
--   priority = 1000,
--   config = function()
--     require("cyberdream").setup({
--       transparent = true,
--       variant = "default",   -- or "muted" / "light" / "auto"
--     })
--     vim.cmd.colorscheme("cyberdream")
--   end,
-- }

-- 256 NOIR   colorscheme: 256_noir   (256-color terminal, VimScript)
-- return {
--   "andreasvc/vim-256noir",
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme("256_noir")
--   end,
-- }

-- JB
-- return {
--   "nickkadutskyi/jb.nvim",
--   priority = 1000,
--   config = function()
--     require("jb").setup({
--       transparent = true,
--       telescope = { enabled = false },
--     })
--     vim.cmd.colorscheme("jb")
--   end,
-- }

-- LACKLUSTER   colorscheme: lackluster | lackluster-hack | lackluster-mint
--                                        | lackluster-dark | lackluster-night
-- return {
--   "slugbyte/lackluster.nvim",
--   priority = 1000,
--   config = function()
--     -- setup() MUST be called before colorscheme()
--     require("lackluster").setup({})   -- add tweak_background = { normal = "none" } for transparent
--     vim.cmd.colorscheme("lackluster")   -- or lackluster-hack / -mint / -dark / -night
--   end,
-- }

-- DARKROSE   colorscheme: darkrose

return {
  "water-sucks/darkrose.nvim",
  priority = 1000,
  config = function()
    require("darkrose").setup({
      styles = { bold = true, italic = true, underline = true },
    })
    vim.cmd.colorscheme("darkrose")
  end,
}
