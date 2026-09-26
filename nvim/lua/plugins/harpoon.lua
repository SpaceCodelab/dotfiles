return {
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon").setup({
        global_settings = {
          save_on_change = true,
          save_on_toggle = false,
          excluded_filetypes = { "harpoon" },
          tabline = false,
        },
      })

      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon add file" })
      vim.keymap.set("n", "<leader>rm", mark.rm_file, { desc = "Harpoon remove file" })
      vim.keymap.set("n", "<leader>m", ui.toggle_quick_menu, { desc = "Harpoon menu" })
      vim.keymap.set("n", "<leader>n", ui.nav_next, { desc = "Harpoon next" })
      vim.keymap.set("n", "<leader>p", ui.nav_prev, { desc = "Harpoon prev" })
      for i = 1, 9 do
        vim.keymap.set("n", "<leader>" .. i, function()
          ui.nav_file(i)
        end, { desc = "Harpoon goto " .. i })
      end
    end,
  },
}
