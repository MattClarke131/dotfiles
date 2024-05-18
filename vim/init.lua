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
