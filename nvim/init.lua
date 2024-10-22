-- Leader
vim.g.mapleader = ' '

-- disable netrw at the very start of your init.lua
-- neovim's built-in file explorer
-- replaced by nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('core.functions.help-tips')
require('core.plugins')
require('core.keymaps')
require('core.language-servers')
require('core.vim-options')

vim.cmd [[colorscheme edge]]
