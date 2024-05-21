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
      lualine_a = {'mode'},
      lualine_b = {'diff'},
      lualine_c = {
        'branch',
        {
          function()  -- Custom component for macro recording
            local recording_register = vim.fn.reg_recording()
            if recording_register ~= '' then
              return 'Recording @' .. recording_register
            end
            return ''
          end,
          color = { fg = '#ff9e64', gui = 'bold' }, -- Optional: color customization
        }
    },
      lualine_x = {'searchcount', 'progress'},
      lualine_y = {'location', 'filename'},
      -- find something custom to put here
      lualine_z = { 'g:help_tip' },
      --lualine_a = {'mode'},
      --lualine_b = {'branch'},
      --lualine_c = {'filename'},
      --lualine_x = {'encoding', 'fileformat', 'filetype'},
      --lualine_y = {'progress'},
      --lualine_z = {'location'}
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
