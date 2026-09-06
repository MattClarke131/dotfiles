local M = {}

local completion_enabled = true

-- Toggle completion on/off, persisting until toggled back (unlike the
-- default '<C-e>' cancel, which only hides the menu until the next keystroke)
function M.toggle_completion()
  completion_enabled = not completion_enabled
  require('blink.cmp').hide()
  vim.notify('Completion ' .. (completion_enabled and 'enabled' or 'disabled'), vim.log.levels.INFO)
end

require('blink.cmp').setup({
  enabled = function() return completion_enabled end,
  keymap = {
    preset = 'default',
    ['<C-e>'] = false, -- freed up for the toggle bound in keymaps.lua instead of cancel/fallback
  },
  appearance = {
    nerd_font_variant = 'mono',
  },
  completion = {
    documentation = { auto_show = true },
  },
  signature = { enabled = true },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
})

return M
