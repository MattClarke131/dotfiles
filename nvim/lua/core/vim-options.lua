-- Buftabline
-- Enable buftabline numbers
vim.g.buftabline_numbers = 1

-- Command Mode
-- Hitting TAB in command mode will show possible completions
vim.opt.wildmenu = true
vim.opt.wildmode = 'list:longest,full'
vim.opt.wildignore = '*.DS_STORE,*.db,node_modules/**,*.jpg,*.png,*.gif'

-- Behavior
-- set undo directory
vim.opt.undodir = vim.fn.expand('~/.vim/undofiles')
vim.opt.undofile = true
-- set swap directory
vim.opt.directory = vim.fn.expand('~/.vim/swapfiles')

-- Turn off audio bell, turn on visual bell
vim.opt.errorbells = false
vim.opt.visualbell = true
-- Vim monitors file changes in realtime
-- autoread only reads the file when vim does an action
vim.opt.autoread = true
-- save uno trees in a file
vim.opt.undofile = true
-- controls how quickly vim writes a swp file (among other things)
vim.opt.updatetime = 100

-- Navigation
-- keeps lines above and below when scrolling
vim.opt.scrolloff = 20
-- use mouse for navigation
vim.opt.mouse = 'a'

-- Display
-- Options
vim.opt.number = true
-- display whitespace characters
vim.opt.list = true
vim.opt.listchars = {tab = '>-'}
-- display status line always
vim.opt.laststatus = 2
-- display cursor line
vim.opt.cursorline = true
-- highlight matching parentheses / brackets
vim.opt.showmatch = true
-- syntax highlighting
vim.opt.syntax = 'on'
-- Highlight yanked text
vim.api.nvim_exec([[
  autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup='Visual', timeout=1000}
]], false)
-- Hide cmd line
vim.opt.cmdheight = 0

-- Formatting
vim.opt.filetype = 'on'
-- auto indent
vim.opt.autoindent = true
-- 2 spaces instead of tabs
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
-- spellchecking
vim.opt.spelllang = 'en-us'
-- do not display tabs and spaces
vim.opt.list = false

-- markdown
-- Set tab width default
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.o.tabstop = 2
    vim.o.shiftwidth = 2
  end,
})

-- typescript
vim.api.nvim_create_autocmd("FileType", {
  pattern = "typescript",
  callback = function()
    vim.opt.expandtab = true
    vim.o.tabstop = 2
    vim.o.shiftwidth = 2
  end,
})

-- shell
-- .env.exammple files are shell scripts
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.env.example",
  callback = function()
    vim.bo.filetype = "sh"
  end,
})
