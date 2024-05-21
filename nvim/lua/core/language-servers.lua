  -- The ordering of mason, mason-lspconfig, and lspconfig is important
require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'tsserver',
    'lua_ls',
    'bashls',
  },
})

local on_attach = require('core.keymaps').on_attach
-- servers
require('lspconfig').tsserver.setup{
  on_attach = on_attach,
}
require('lspconfig').lua_ls.setup{
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}
