-- The ordering of mason and mason-lspconfig is important.
-- mason-lspconfig must be set up before enabling LSP servers.
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
vim.lsp.config('ts_ls', {
  root_markers = {
    'pnpm-workspace.yaml',
    'tsconfig.json',
    'package.json',
    '.git',
  },
})

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
})

vim.lsp.enable({ 'ts_ls', 'lua_ls', 'bashls', 'vtsls' })

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
