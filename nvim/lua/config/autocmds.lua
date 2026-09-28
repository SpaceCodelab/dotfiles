-- LSP buffer-local keymaps and format-on-save.
-- Server configs live in ~/.config/nvim/lsp/, enable logic in ~/.config/nvim/lua/config/lsp.lua.
-- Neovim 0.12 already provides defaults for gra/grn/grr/gri/grt/grx/gO.

local function attach_keymaps(event)
  local client = vim.lsp.get_client_by_id(event.data.client_id)
  if not client then
    return
  end

  local function map(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = event.buf, desc = desc })
  end

  map("n", "K", vim.lsp.buf.hover, "LSP hover")
  if client:supports_method("textDocument/signatureHelp") then
    map("n", "gK", vim.lsp.buf.signature_help, "LSP signature help")
  end
  map("n", "gd", vim.lsp.buf.definition, "LSP goto definition")
  map("n", "gD", vim.lsp.buf.declaration, "LSP goto declaration")
  map("n", "gI", vim.lsp.buf.implementation, "LSP goto implementation")
  map("n", "<leader>lf", function()
    vim.lsp.buf.format({ bufnr = event.buf, timeout_ms = 3000 })
  end, "LSP format buffer")
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("LspMappings", { clear = true }),
  desc = "LSP buffer-local keymaps",
  callback = attach_keymaps,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = true }),
  pattern = "*",
  desc = "Format buffer with LSP on save",
  callback = function(event)
    local clients = vim.lsp.get_clients({ bufnr = event.buf })
    for _, client in ipairs(clients) do
      if client:supports_method("textDocument/formatting") then
        vim.lsp.buf.format({ bufnr = event.buf, timeout_ms = 3000 })
        break
      end
    end
  end,
})