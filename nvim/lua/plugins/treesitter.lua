---@module "lazy"
---@type LazySpec
return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local ts = require("nvim-treesitter")

            -- Compiles any missing parsers on first launch; no-op afterwards.
            -- markdown_inline is pulled in automatically via markdown's
            -- `requires` entry, so 25 entries yield 26 parsers.
            ts.install({
                -- core
                "lua",
                "vim",
                "vimdoc",
                "json",
                "bash",
                -- systems
                "c",
                "cpp",
                "go",
                "rust",
                "zig",
                -- scripting
                "python",
                "haskell",
                -- web / markup
                "markdown",
                "latex",
            }, { max_jobs = 8 })

            local group = vim.api.nvim_create_augroup("TreesitterSetup", { clear = true })

            -- Highlighting only. Treesitter indentation is experimental upstream,
            -- so indentexpr is intentionally left alone.
            vim.api.nvim_create_autocmd("FileType", {
                group = group,
                desc = "Enable treesitter highlighting",
                callback = function(event)
                    if vim.bo[event.buf].buftype ~= "" then
                        return
                    end
                    local lang = vim.treesitter.language.get_lang(event.match) or event.match
                    pcall(vim.treesitter.start, event.buf, lang)
                end,
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        lazy = false,
        config = function()
            require("nvim-treesitter-textobjects").setup({
                select = {
                    lookahead = true,
                },
            })

            -- The plugin registers no keymaps of its own and has no `keymaps`
            -- setup option, so they are declared here. @function.* comes from
            -- the plugin's own textobjects.scm, so it works in any language.
            for _, key in ipairs({ "af", "if" }) do
                vim.keymap.set({ "x", "o" }, key, function()
                    require("nvim-treesitter-textobjects.select")
                        .select_textobject("@function.inner", "textobjects")
                end)
            end
        end,
    },
}
