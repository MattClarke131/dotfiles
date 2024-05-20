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
  'neovim/nvim-lspconfig',
  'github/copilot.vim',
  'nvim-treesitter/nvim-treesitter',
  -- possibly unnecessary with treesitter
  -- 'leafgarland/typescript-vim',
  -- 'pangloss/vim-javascript',

  -- tools
  {'preservim/nerdtree',
    config = function()
      -- Close nerd tree on file open
      vim.g.NERDTreeQuitOnOpen = 1
      -- Delete buffer if file is deleted with NERDTree
      vim.g.NERDTreeAutoDeleteBuffer = 1
    end
  },
  {'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
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

-- Language Server Protocol
-- unsure if needed
require'lspconfig'.tsserver.setup{}

require('core.plugin_config.lualine')
require('core.plugin_config.nvim-treesitter')
require('core.plugin_config.telescope')
require('core.plugin_config.gitgutter')
