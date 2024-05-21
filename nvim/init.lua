-- Leader
vim.g.mapleader = ' '

-- disable netrw at the very start of your init.lua
-- neovim's built-in file explorer
-- replaced by nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('core.plugins')
require('core.keymaps')
require('core.language-servers')
require('core.vim-options')

vim.cmd [[colorscheme everforest]]

-- help tips
local helptips = {
  'in tree g? for help',
  'in tree <C-n> create',
  'gd go to definition',
  'gr references',
  'gi implementation',
  'gh hover',
  'rn rename',
  'ca code action',
}

math.randomseed(os.time())
local function getRandomHelpTip()
  return helptips[math.random(#helptips)]
end
vim.g.help_tip = getRandomHelpTip()
