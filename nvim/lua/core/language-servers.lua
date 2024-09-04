  -- The ordering of mason, mason-lspconfig, and lspconfig is important
require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'lua_ls',
    'bashls',
    -- typescript
    'vtsls',
  },
})

local set_keymaps = require('core.keymaps').set_lsp_keymaps
-- servers
require('lspconfig').tsserver.setup{
  on_attach = set_keymaps,
}
require('lspconfig').lua_ls.setup{
  on_attach = set_keymaps,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}
