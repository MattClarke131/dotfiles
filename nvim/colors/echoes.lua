vim.cmd('hi clear');
vim.g.colors_name = 'echoes'

-- Palette
-- Base colors
local colors = {
  blue    = '#61afef',
}

-- Semantic
local semantic = {
  data = colors.blue,
}

-- Highlight groups
vim.api.nvim_set_hl(0, '@number', { fg = semantic.data })
vim.api.nvim_set_hl(0, '@string', { fg = semantic.data })
vim.api.nvim_set_hl(0, '@function', { fg = semantic.data })

