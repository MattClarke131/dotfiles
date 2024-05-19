-- I forget, but I believe this has something to do with neoVim
vim.cmd([[
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
]])

-- Language Server Protocol
require'lspconfig'.tsserver.setup{}

-- Highlight yanked text
vim.api.nvim_exec([[
autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup='Visual', timeout=1000}
]], false)

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

require('lazy').setup({
})
