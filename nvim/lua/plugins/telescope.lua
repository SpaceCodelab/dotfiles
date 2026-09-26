return {
    "nvim-telescope/telescope.nvim",

    dependencies = {
        "nvim-lua/plenary.nvim",
        "ThePrimeagen/harpoon",
    },

    config = function()
        require('telescope').setup({
            defaults = {
                layout_config = {
                    horizontal = {
                        preview_cutoff = 1,
                        width = 0.6,
                        height = 0.6,
                    },
                },
            },
        })

        require("telescope").load_extension("harpoon")

        local preview_utils = require("telescope.previewers.utils")
        preview_utils.ts_highlighter = function(bufnr, ft)
            local lang = vim.treesitter.language.get_lang(ft) or ft
            if not lang or lang == "" then
                return false
            end

            return pcall(vim.treesitter.start, bufnr, lang)
        end

        local builtin = require('telescope.builtin')

        local function search_opts(extra)
            return vim.tbl_extend("force", {
                cwd = require("telescope.utils").buffer_dir(),
                hidden = true,
            }, extra or {})
        end

        vim.keymap.set('n', '<leader>ff', function()
            builtin.find_files(search_opts({
                find_command = { "rg", "--files", "--color", "never", "--glob", "!.git" },
                previewer = false,
            }))
        end, { desc = "Find files" })

        vim.keymap.set('n', '<leader>gf', function()
            builtin.git_files(search_opts({ show_untracked = true, previewer = false }))
        end, { desc = "Git files" })

        vim.keymap.set('n', '<leader>ps', function()
            builtin.live_grep(search_opts())
        end, { desc = "Live grep" })

        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help tags" })
    end
}
