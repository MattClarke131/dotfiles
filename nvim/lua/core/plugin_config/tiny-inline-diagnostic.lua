require('tiny-inline-diagnostic').setup({
  -- Available: "modern", "classic", "minimal", "powerline", "ghost", "simple", "nonerdfont", "amongus"
  -- preset = "modern",
  preset = "ghost",

  options = {
    show_source = true,
    severity = {
      vim.diagnostic.severity.ERROR,
      -- vim.diagnostic.severity.WARN,
      -- vim.diagnostic.severity.INFO,
      -- vim.diagnostic.severity.HINT,
    },
    multilines = {
      enabled = true,
    },
    -- show_diags_only_under_cursor = false,
    enable_on_insert = true,
    overflow = {
      mode = "wrap",
      -- padding = 0,
    },
  }
})
