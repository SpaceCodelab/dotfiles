return {
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({})
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    init = function()
      -- Back-compat shim. colorizer's lua/colorizer/nvim.lua:96 still calls
      -- vim.tbl_flatten, which Neovim 0.11 deprecated and 0.12 dropped from
      -- api.txt. The function still works but warns on every startup.
      -- Restored here with the stock implementation; remove once the plugin
      -- is updated to use a table.concat-based replacement.
      vim.tbl_flatten = function(t)
        local result = {}
        local function _tbl_flatten(_t)
          for i = 1, #_t do
            local v = _t[i]
            if type(v) == "table" then
              _tbl_flatten(v)
            elseif v then
              result[#result + 1] = v
            end
          end
        end
        _tbl_flatten(t)
        return result
      end
    end,
    config = function()
      require("colorizer").setup(nil, {
        rgb_fn = true,
        hsl_fn = true,
      })
    end,
  },
  {
    "mbbill/undotree",
    init = function()
      -- undotree is pure Vimscript (no lua/ dir), so it has no setup() and is
      -- configured via g:undotree_* variables. plugin/undotree.vim reads all of
      -- them at load time behind `if !exists()` guards, so they must be set
      -- here in lazy's init hook, not in config -- config runs after the guards
      -- have already frozen the defaults and the values would be ignored.
      vim.g.undotree_WindowLayout = 1
      vim.g.undotree_DiffAutoOpen = 1
    end,
    keys = {
      { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undotree toggle" },
      { "<leader>U", "<cmd>UndotreeFocus<cr>", desc = "Undotree focus" },
    },
  },
}
