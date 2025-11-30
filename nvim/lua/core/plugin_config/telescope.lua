require('telescope').setup {
  dependencies = {
    'nvim-lua/plenary.nvim',
    'BurntSushi/ripgrep',
    'nvim-telescope/telescope-live-grep-args.nvim',
  },
  defaults = {
    file_ignore_patterns = {
      'node_modules',
      '.git',
      'backup-dotfiles',
      'submodules',
      'env',
    },
  },
  pickers = {
    colorscheme = {
      enable_preview = true
    }
  },
  extensions = {
    -- to try
    -- https://github.com/dhruvmanila/browser-bookmarks.nvim
    -- clipboard manager
    -- https://github.com/AckslD/nvim-neoclip.lua
    -- file browsers
    -- https://github.com/salorak/whaler.nvim
    -- https://github.com/nvim-telescope/telescope-file-browser.nvim
    -- menu creator
    -- https://github.com/octarect/telescope-menu.nvim
    -- undo tree explorer
    -- https://github.com/debugloop/telescope-undo.nvim
  },
}
telescope = require('telescope')
telescope.load_extension('noice')
telescope.load_extension('live_grep_args')
