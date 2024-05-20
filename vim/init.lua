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
  {'nvim-treesitter/nvim-treesitter',
    ensure_installed = {
    'javascript', 'jsx', 'typescript', 'tsx', 'json', 'lua', 'python', 'c', 'vim', 'zsh', 'bash', 'dockerfile', 'html', 'css', 'scss', 'yaml', 'scheme', 'lisp'
    },
    highlight = {
      enable = true,
    },
    auto_install = true,
  },
  -- possibly unnecessary with treesitter
  -- 'leafgarland/typescript-vim',
  -- 'pangloss/vim-javascript',

  -- tools
  'scrooloose/nerdtree',
  'junegunn/fzf',
  'junegunn/fzf.vim',

  -- visual changes
  'airblade/vim-gitgutter',
  'ap/vim-buftabline',

  -- themes
  {'neanias/everforest-nvim', background = 'hard'},
  'rebelot/kanagawa.nvim',
  'rmehri01/onenord.nvim',

  -- to try
  -- 'nvim-telescope/telescope.nvim',
  -- 'tpope/vim-fugitive',
  -- 'nvim-lualine/lualine.nvim',
  -- 'ibhagwan/fzf-lua'
  --
})

-- Language Server Protocol
require'lspconfig'.tsserver.setup{}

-- Leader
vim.g.mapleader = ' '

-- Plugin Keybindings
-- Nerdtree
-- Options
-- Close nerd tree on file open
vim.g.NERDTreeQuitOnOpen = 1

-- Delete buffer if file is deleted with NERDTree
vim.g.NERDTreeAutoDeleteBuffer = 1

-- Mapping
vim.keymap.set('n', '<Leader>nf', ':NERDTreeToggle<Enter>', { noremap = true})
vim.keymap.set('n', '<Leader>nv', ':NERDTreeFind<Enter>', { noremap = true, silent = true})


-- FZF
-- Options
-- Use ripgrep
vim.g.fzf_command_prefix = 'rg --files --hidden --follow --glob "!.git/* --glob "!node_modules/*" --glob "!~/dotfiles/submodules/*"'
-- Mapping
-- Find files
vim.keymap.set('n', '<Leader>ff', ':FZF<Enter>', { noremap = true})
-- Find buffers
vim.keymap.set('n', '<Leader>fb', ':Buffers<Enter>', { noremap = true})
-- Find history
vim.keymap.set('n', '<Leader>fh', ':History<Enter>', { noremap = true})
-- Find commands
vim.keymap.set('n', '<Leader>fc', ':Commands<Enter>', { noremap = true})
-- Find maps
vim.keymap.set('n', '<Leader>fm', ':Maps<Enter>', { noremap = true})
-- Find lines
vim.keymap.set('n', '<Leader>fl', ':Lines<Enter>', { noremap = true})
-- Find commits
vim.keymap.set('n', '<Leader>fg', ':Commits<Enter>', { noremap = true})
-- Find colors
vim.keymap.set('n', '<Leader>fs', ':Colors<Enter>', { noremap = true})


-- Gitgutter
-- Options
-- Disable default keybindings
vim.g.gitgutter_map_keys = 0
-- Mapping
-- next hunk
vim.keymap.set('n', '<Leader>gn', ':GitGutterNextHunk<Enter>', { noremap = true})
-- previous hunk
vim.keymap.set('n', '<Leader>gp', ':GitGutterPrevHunk<Enter>', { noremap = true})
-- preview hunk
vim.keymap.set('n', '<Leader>gP', ':GitGutterPreviewHunk<Enter>', { noremap = true})
-- stage hunk
vim.keymap.set('n', '<Leader>gs', ':GitGutterStageHunk<Enter>', { noremap = true})
-- undo hunk
vim.keymap.set('n', '<Leader>gu', ':GitGutterUndoHunk<Enter>', { noremap = true})
-- toggle line highlights
vim.keymap.set('n', '<Leader>gh', ':GitGutterLineHighlightsToggle<Enter>', { noremap = true})

-- Buftabline
-- Enable buftabline numbers
vim.g.buftabline_numbers = 1

-- Commands
-- Hitting TAB in command mode will show possible completions
vim.opt.wildmenu = true
vim.opt.wildmode = 'list:longest,full'
vim.opt.wildignore = '*.DS_STORE,*.db,node_modules/**,*.jpg,*.png,*.gif'

-- Keybindings
-- unmap EX mode
vim.keymap.set('n', 'Q', '<nop>', { noremap = true})
-- map 'kj' to esc. `^ is to keep cursor in it's position
vim.keymap.set('i', 'kj', '<esc>`^', { noremap = true})
-- map <Leader>s to esc and save.
vim.keymap.set('n', '<Leader>s', ':w<Enter>', { noremap = true})
-- map ';lkj' to save and quit.
vim.keymap.set('i', '<Leader>;lkj', '<esc>:wq<Enter>', { noremap = true})
vim.keymap.set('n', '<Leader>;lkj', ':q<Enter>', { noremap = true})
-- move normally between wrapped lines
vim.keymap.set('n', 'j', 'gj', { noremap = true})
vim.keymap.set('n', 'k', 'gk', { noremap = true})
-- move to the end of the line
vim.keymap.set('n', 'L', '$', { noremap = true})
-- move to the beginning of the line
vim.keymap.set('n', 'H', '^', { noremap = true})
-- toggle paste mode
vim.keymap.set('n', '<Leader>tp', ':set paste!<Enter>', { noremap = true})
-- switch ; and :
-- turns out the default is useful
-- vim.keymap.set('n', ';', ':', { noremap = true})

-- Navigation
-- Quick buffer navigation
vim.keymap.set('n', '<Leader>l', ':bnext<Enter>', { noremap = true})
vim.keymap.set('n', '<Leader>h', ':bprev<Enter>', { noremap = true})
vim.keymap.set('n', '<Leader>j', ':e<Space>', { noremap = true})
vim.keymap.set('n', '<Leader>k', ':bd<Enter>', { noremap = true})
-- keeps lines above and below when scrolling
vim.opt.scrolloff = 20
-- use mouse for navigation
vim.opt.mouse = 'a'

-- Language specific keybindings
-- Insert debugger
-- JS
vim.keymap.set('n', '<Leader>qd', 'odebugger;<esc>', { noremap = true})
vim.keymap.set('n', '<Leader>qD', 'Odebugger;<esc>', { noremap = true})

-- Behavior
-- Options
-- set undo directory
vim.opt.undodir = '~/.vim/undofiles'
-- set swap directory
vim.opt.directory = '~/.vim/swapfiles'

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

-- Search
-- ignore case when searching, except when using capital letters
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- search as characters are entered
vim.opt.incsearch = true
-- highlight matches
vim.opt.hlsearch = true
-- unhighlight matches on pressing enter
vim.keymap.set('n', '<CR>', ':nohls<CR><CR>', { noremap = true, silent = true})

-- Display
-- Themes
vim.cmd [[colorscheme everforest]]

-- Options
-- Display line numbers
vim.opt.number = true
-- display whitespace characters
vim.opt.list = true
vim.opt.listchars = {eol = '¬', tab = '>-'}
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

-- Formatting
-- auto indent
vim.opt.autoindent = true
-- 2 spaces instead of tabs
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
-- spellchecking
vim.opt.spelllang = 'en-us'
