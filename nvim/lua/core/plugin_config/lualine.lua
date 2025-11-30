local function macro_status()  -- Custom component for macro recording
  local recording_register = vim.fn.reg_recording()
  if recording_register ~= '' then
    return '@' .. recording_register
  end
  return ''
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = {left = '', right = ''},
    section_separators = {left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
  lualine_a = {'mode', macro_status, },
  lualine_b = {
    'branch',
    'diff',
  },
  lualine_c = {},
  lualine_x = {'searchcount', 'progress'},
  lualine_y = {
    {
      'diagnostics',
      sources = { 'nvim_lsp' },
      sections = { 'error', 'warn', 'info', 'hint' },
      color_error = '#ff0000',
      color_warn = '#ff8800',
      color_info = '#00ff00',
      color_hint = '#00ffff',
      symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
      always_visible = false,
    },
  },
  lualine_z = { 'g:help_tip' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
}
