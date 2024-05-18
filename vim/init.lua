-- I forget, but I believe this has something to do with neoVim
vim.cmd([[
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
]])

-- Language Server Protocol
require'lspconfig'.tsserver.setup{}
