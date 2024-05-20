-- Leader
vim.g.mapleader = ' '

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
  {'preservim/nerdtree',
    config = function()
      -- Close nerd tree on file open
      vim.g.NERDTreeQuitOnOpen = 1
      -- Delete buffer if file is deleted with NERDTree
      vim.g.NERDTreeAutoDeleteBuffer = 1
    end
  },
  {'nvim-telescope/telescope.nvim',
    dependencies = { 
      'nvim-lua/plenary.nvim',
      'BurntSushi/ripgrep',
      'nvim-treesitter/nvim-treesitter',
    },
    extensions = {
      -- to try
      -- https://github.com/dhruvmanila/browser-bookmarks.nvim
      -- clipboard manager
      -- https://github.com/AckslD/nvim-neoclip.lua
      -- file browsers
      -- https://github.com/salorak/whaler.nvim
      -- https://github.com/nvim-telescope/telescope-file-browser.nvim
      -- menu creator
      -- https://github.com/octarect/telescope-menu.nvim
      -- undo tree explorer
      -- https://github.com/debugloop/telescope-undo.nvim
    },
    pickers = {
      find_files = {
        -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
        find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*", "--glob", "!**/node_modules/*" }
      }
    },
  },

  -- visual changes
  {'airblade/vim-gitgutter',
    config = function()
      -- Disable default keybindings
      vim.g.gitgutter_map_keys = 0
      -- Enable GitGutter line number highlights
      vim.cmd('GitGutterLineNrHighlightsEnable')
      -- Enable GitGutter line highlights
      vim.cmd('GitGutterLineHighlightsEnable')
      -- Enable GitGutter signs
      vim.cmd('GitGutterSignsEnable')

      -- Define symbols for added, modified, and removed lines
      vim.g.gitgutter_sign_added = '+'
      vim.g.gitgutter_sign_modified = '~'
      vim.g.gitgutter_sign_removed = '-'
    end
  },
  'ap/vim-buftabline',
  {'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    options = {
      icons_enabled = true,
      theme = 'auto',
      component_separators = {left = '', right = ''},
      section_separators = {left = '', right = ''},
      disabled_filetypes = {},
      always_divide_middle = true,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      }
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'diff'},
      lualine_c = {
        'branch',
        {
          function()  -- Custom component for macro recording
            local recording_register = vim.fn.reg_recording()
            if recording_register ~= '' then
              return 'Recording @' .. recording_register
            end
            return ''
          end,
          color = { fg = '#ff9e64', gui = 'bold' }, -- Optional: color customization
        }
    },
      lualine_x = {'searchcount', 'progress'},
      lualine_y = {'location', 'filename'},
      -- find something custom to put here
      lualine_z = {}
      --lualine_a = {'mode'},
      --lualine_b = {'branch'},
      --lualine_c = {'filename'},
      --lualine_x = {'encoding', 'fileformat', 'filetype'},
      --lualine_y = {'progress'},
      --lualine_z = {'location'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
  },

  -- themes
  {'neanias/everforest-nvim', background = 'hard'},
  'rebelot/kanagawa.nvim',
  'rmehri01/onenord.nvim',

  -- to try
  -- 'tpope/vim-fugitive',
})

-- Language Server Protocol
require'lspconfig'.tsserver.setup{}

-- Plugin Keybindings
-- Nerdtree

-- Mapping
vim.keymap.set('n', '<Leader>nf', ':NERDTreeToggle<Enter>', { noremap = true })
vim.keymap.set('n', '<Leader>nv', ':NERDTreeFind<Enter>', { noremap = true, silent = true })


-- Telescope
-- Mapping
local builtin = require('telescope.builtin')
-- Find files
vim.keymap.set('n', '<leader>ff', builtin.find_files)
-- Find buffers
vim.keymap.set('n', '<Leader>fb', builtin.buffers)
-- Find lines with rg
vim.keymap.set('n', '<Leader>fr', builtin.live_grep)
-- Find commands
vim.keymap.set('n', '<Leader>fc', builtin.command_history)
-- Find vim options
vim.keymap.set('n', '<Leader>fv', builtin.vim_options)
-- List registers
vim.keymap.set('n', '<Leader>fp', builtin.registers)
-- List keymaps
vim.keymap.set('n', '<Leader>fm', builtin.keymaps)
-- Find commits
vim.keymap.set('n', '<Leader>fcc', builtin.git_commits)
-- Find commits only for this buffer
vim.keymap.set('n', '<Leader>fcb', builtin.git_commits)
-- rp string under cursor or current selection
vim.keymap.set('n', '<Leader>fs', builtin.git_commits)


-- Gitgutter
-- Options
-- Disable default keybindings
vim.g.gitgutter_map_keys = 0
-- Mapping
-- next hunk
vim.keymap.set('n', '<Leader>gn', '<Plug>(GitGutterNextHunk)', { noremap = true })
-- previous hunk
vim.keymap.set('n', '<Leader>gp', '<Plug>(GitGutterPrevHunk)', { noremap = true })
-- preview hunk
vim.keymap.set('n', '<Leader>gP', '<Plug>(GitGutterPreviewHunk)', { noremap = true })
-- stage hunk
vim.keymap.set('n', '<Leader>gs', '<Plug>(GitGutterStageHunk)', { noremap = true })
-- undo hunk
vim.keymap.set('n', '<Leader>gu', '<Plug>(GitGutterUndoHunk)', { noremap = true })
-- toggle line highlights
vim.keymap.set('n', '<Leader>gh', '<Plug>(GitGutterLineHighlightsToggle)', { noremap = true })
-- next/previous hunk
vim.keymap.set('n', ']]', ':silent! GitGutterNextHunk<Enter>', { noremap = true, silent = true })
vim.keymap.set('n', '[[', ':silent! GitGutterPrevHunk<Enter>', { noremap = true, silent = true })


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
vim.keymap.set('n', 'Q', '<nop>', { noremap = true })
-- map 'kj' to esc. `^ is to keep cursor in it's position
vim.keymap.set('i', 'kj', '<esc>`^', { noremap = true })
-- map <Leader>s to esc and save.
vim.keymap.set('n', '<Leader>s', ':w<Enter>', { noremap = true })
-- map ';lkj' to save and quit.
vim.keymap.set('i', '<Leader>;lkj', '<esc>:wq<Enter>', { noremap = true })
vim.keymap.set('n', '<Leader>;lkj', ':q<Enter>', { noremap = true })
-- move normally between wrapped lines
vim.keymap.set('n', 'j', 'gj', { noremap = true })
vim.keymap.set('n', 'k', 'gk', { noremap = true })
-- move to the end of the line
vim.keymap.set('n', 'L', '$', { noremap = true })
-- move to the beginning of the line
vim.keymap.set('n', 'H', '^', { noremap = true })
-- toggle paste mode
vim.keymap.set('n', '<Leader>tp', ':set paste!<Enter>', { noremap = true })
-- switch ; and :
-- turns out the default is useful
-- vim.keymap.set('n', ';', ':', { noremap = true })

-- Navigation
-- Quick buffer navigation
vim.keymap.set('n', '<Leader>l', ':bnext<Enter>', { noremap = true })
vim.keymap.set('n', '<Leader>h', ':bprev<Enter>', { noremap = true })
vim.keymap.set('n', '<Leader>j', ':e<Space>', { noremap = true })
vim.keymap.set('n', '<Leader>k', ':bd<Enter>', { noremap = true })
-- keeps lines above and below when scrolling
vim.opt.scrolloff = 20
-- use mouse for navigation
vim.opt.mouse = 'a'

-- Language specific keybindings
-- Insert debugger
-- JS
vim.keymap.set('n', '<Leader>qd', 'odebugger;<esc>', { noremap = true })
vim.keymap.set('n', '<Leader>qD', 'Odebugger;<esc>', { noremap = true })

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
vim.keymap.set('n', '<CR>', ':nohls<CR><CR>', { noremap = true, silent = true })

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
-- Hide cmd line
vim.opt.cmdheight = 0


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

-- Set colorscheme
vim.cmd [[colorscheme everforest]]
