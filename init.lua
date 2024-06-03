-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require("lspconfig").tsserver.setup({
  capabilities = capabilities,
})
require("lspconfig").lua_ls.setup({
  capabilities = capabilities,
})
require("lspconfig").cairo_ls.setup({
  capabilities = capabilities,
  cmd = { "scarb", "cairo-language-server", "/C", "--node-ipc" },
})
require("lspconfig").rust_analyzer.setup({
  capabilities = capabilities,
})
require("lspconfig").pyright.setup({
  capabilities = capabilities,
})
