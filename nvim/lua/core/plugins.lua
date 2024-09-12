-- lazy package manager
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
require('lazy').setup({

-- language processing and syntax
  'github/copilot.vim',
  --parser generator for syntax highlighting
  'nvim-treesitter/nvim-treesitter',
  -- package manager for LSPs, DAPs, linters, and formatters
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  -- diagnostics / references / etc
  {'folke/trouble.nvim', dependencies = { "nvim-tree/nvim-web-devicons" } },
  -- auto close
  'windwp/nvim-autopairs',

-- tools
  'nvim-telescope/telescope.nvim',
  {"nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  'tpope/vim-commentary',
  'christoomey/vim-tmux-navigator',

-- visual changes
  {'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'BurntSushi/ripgrep',
      'nvim-treesitter/nvim-treesitter',
    },
  },
  'airblade/vim-gitgutter',
  -- 'ap/vim-buftabline',
  {"folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  {'romgrk/barbar.nvim',
    version = '^1.0.0',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    opts = {
      animation = false,
      tabpages = true,
      semantic_letters = false,
      sort = { ignore_case = true },
      icons = { buffer_index = 'superscript'},
      letters = 'asdfghjkl;qwertyuiopASDFGHJKL:QWERTYUIOP',
    },
  },

-- themes
  {'neanias/everforest-nvim', background = 'hard'},
  'rebelot/kanagawa.nvim',
  'rmehri01/onenord.nvim',
  'ellisonleao/gruvbox.nvim',

-- to try
  -- 'tpope/vim-fugitive',
  -- file explorer
  -- https://github.com/nvim-tree/nvim-tree.lua
})

require('core.plugin_config.lualine')
require('core.plugin_config.nvim-treesitter')
require('core.plugin_config.telescope')
require('core.plugin_config.gitgutter')
require('core.plugin_config.nvim-tree')
require('core.plugin_config.trouble')
require('core.plugin_config.noice')
require('core.plugin_config.autopairs')
