-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- lsp setup
local lsp = require("lspconfig")

-- Setup language servers.
lsp.tsserver.setup({})
lsp.lua_ls.setup({})
lsp.cairo_ls.setup({
  cmd = { "scarb", "cairo-language-server", "/C", "--node-ipc" },
})
lsp.rust_analyzer.setup({})
lsp.pyright.setup({})
