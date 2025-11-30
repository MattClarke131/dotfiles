require('tiny-inline-diagnostic').setup({
  -- Available: "modern", "classic", "minimal", "powerline", "ghost", "simple", "nonerdfont", "amongus"
  -- preset = "modern",
  preset = "ghost",

  options = {
    multilines = {
      enabled = true,
    },
    -- show_diags_only_under_cursor = false,
    enable_on_insert = true,
    overflow = {
      mode = "wrap",
      -- padding = 0,
    },
    -- break_line = {
    --   enabled = true,
    --   after = 80,
    -- },
  }
})
