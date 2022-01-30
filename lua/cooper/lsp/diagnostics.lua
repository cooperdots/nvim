-- Automatically update diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true;
  update_in_insert = true;
  virtual_text = { spacing = 4, prefix = "░" };
  severity_sort = true;
})

-- Set diagnostic symbols
local function lspSymbol(name, icon)
  vim.fn.sign_define("DiagnosticSign" .. name, {
    text = icon, texthl = "DiagnosticSign" .. name
  })
end

lspSymbol("Error", " ")
lspSymbol("Information", " ")
lspSymbol("Hint", " ")
lspSymbol("Info", " ")
lspSymbol("Warning", " ")
