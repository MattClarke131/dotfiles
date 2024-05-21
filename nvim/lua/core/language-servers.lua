-- Language Server Protocols
require'lspconfig'.tsserver.setup{}
require'lspconfig'.lua_ls.setup{
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}
