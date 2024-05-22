require('nvim-autopairs').setup({
  event = "InsertEnter",
  disable_in_macro = true,
  disable_in_replace = true,
  check_ts = true,
  ts_config = {
    lua = {'string'}, -- it will not add a pair on that treesitter node
    javascript = {'template_string'},
    java = false, -- don't check treesitter on java
  },
  disable_filetype = { 'TelescopePrompt' },
  --ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
})
