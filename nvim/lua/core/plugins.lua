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

--Plugins
require('lazy').setup({
-- language processing and syntax
  'github/copilot.vim',
  --parser generator for syntax highlighting
  'nvim-treesitter/nvim-treesitter',
  -- package manager for LSPs, DAPs, linters, and formatters
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  -- language server protocol config
  'neovim/nvim-lspconfig',
  -- possibly unnecessary with treesitter
  -- 'leafgarland/typescript-vim',
  -- 'pangloss/vim-javascript',

-- tools
  'nvim-telescope/telescope.nvim',
  {"nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    config = function()
      require("nvim-tree").setup {}
    end,
  },

-- visual changes
  {'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'BurntSushi/ripgrep',
    'nvim-treesitter/nvim-treesitter',
  },
  },
  'airblade/vim-gitgutter',
  'ap/vim-buftabline',

-- themes
  {'neanias/everforest-nvim', background = 'hard'},
  'rebelot/kanagawa.nvim',
  'rmehri01/onenord.nvim',
  "ellisonleao/gruvbox.nvim",

-- to try
  -- 'tpope/vim-fugitive',
  -- file explorer
  -- https://github.com/nvim-tree/nvim-tree.lua
})

require('core.plugin_config.lualine')
require('core.plugin_config.nvim-treesitter')
require('core.plugin_config.telescope')
require('core.plugin_config.gitgutter')
