  -- The ordering of mason, mason-lspconfig, and lspconfig is important
require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'lua_ls',
    'bashls',
    'ts_ls',
    'vtsls',
  },
})

-- servers
require('lspconfig').ts_ls.setup{
  root_dir = require('lspconfig.util').root_pattern(
    'pnpm-workspace.yaml',
    'tsconfig.json',
    'package.json',
    '.git'
  ),
}
require('lspconfig').lua_ls.setup{
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}

-- Diagnostics
-- Using tiny-inline-diagnostic.nvim for virtual text
vim.diagnostic.config({
  -- virtual_text = false;
  -- virtual_text = {
  --   spacing = 4,
  --   prefix = '●',
  -- },
  -- virtual_lines = true,
  underline = true,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = true,
  },
  signs = true,
  -- underline = true,
  -- update_in_insert = false,
  -- severity_sort = false,
})
