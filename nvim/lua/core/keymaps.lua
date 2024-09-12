-- Language server
-- Keybindings for LSP
-- bound upon attaching to a buffer
local go_to_declaration = function ()
  vim.cmd('tag ' .. vim.fn.expand('<cword>'))
end
local set_lsp_keymaps = function (_, bufnr)
  vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, { buffer = bufnr })
  vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, { buffer = bufnr })

  --vim.keymap.set('n', '<Leader>gd', vim.lsp.buf.definition, { buffer = bufnr })
  vim.keymap.set('n', 'gd', go_to_declaration, { buffer = bufnr })
  vim.keymap.set('n', '<Leader>gi', vim.lsp.buf.implementation, { buffer = bufnr })
  vim.keymap.set('n', '<Leader>gh', vim.lsp.buf.hover, { buffer = bufnr })
end

-- help-tips
-- bind leaderq to function cycleHelpTip in file core/functions/help-tips.la
vim.keymap.set('n', '<Leader>q', require('core.functions.help-tips').cycleHelpTip)


-- Vim Tmux Navigator
vim.keymap.set('n', '<C-h>', ':TmuxNavigateLeft<Enter>', { noremap = true })
vim.keymap.set('n', '<C-j>', ':TmuxNavigateDown<Enter>', { noremap = true })
vim.keymap.set('n', '<C-k>', ':TmuxNavigateUp<Enter>', { noremap = true })
vim.keymap.set('n', '<C-l>', ':TmuxNavigateRight<Enter>', { noremap = true })
vim.keymap.set('n', '<C-\\>', ':TmuxNavigatePrevious<Enter>', { noremap = true })


-- Nvim tree
vim.keymap.set('n', '<Leader>nf', ':NvimTreeToggle<Enter>', { noremap = true })


-- Telescope
local telescope = require('telescope.builtin')
-- Find files
local function custom_find_files()
  telescope.find_files {
    find_command = {
      'fd',
      '--type', 'file',
      -- '--color=always',
      '--follow',
      '--hidden',
      '--no-ignore-vcs',
      '--exclude', 'node_modules',
      '--exclude', '.git',
      '--exclude', 'backup-dotfiles',
      '--exclude', 'submodules',
      '--exclude', 'env',
    }
  }
end
vim.keymap.set('n', '<Leader>ff', custom_find_files)
-- Find buffers
vim.keymap.set('n', '<Leader>fb', telescope.buffers)
-- Find lines with rg
vim.keymap.set('n', '<Leader>fr', telescope.live_grep)
-- Find Lines in current buffer
vim.keymap.set('n', '<Leader>/', function()
  telescope.current_buffer_fuzzy_find { previewer=false }
end, { silent=true })
vim.keymap.set('n', '<Leader>f/', function()
  telescope.current_buffer_fuzzy_find { previewer=false }
end, { silent=true })
-- Find commands
vim.keymap.set('n', '<Leader>fc', telescope.commands)
-- Find vim options
vim.keymap.set('n', '<Leader>fv', telescope.vim_options)
-- List registers
vim.keymap.set('n', '<Leader>fp', telescope.registers)
-- List keymaps
vim.keymap.set('n', '<Leader>fm', telescope.keymaps)
-- Find commits
vim.keymap.set('n', '<Leader>fcc', telescope.git_commits)
-- Find commits only for this buffer
vim.keymap.set('n', '<Leader>fcb', telescope.git_commits)
-- rp string under cursor or current selection
vim.keymap.set('n', '<Leader>fs', telescope.git_commits)


-- Gitgutter
-- next hunk
vim.keymap.set('n', '<Leader>ggn', '<Plug>(GitGutterNextHunk)', { noremap = true })
-- previous hunk
vim.keymap.set('n', '<Leader>ggp', '<Plug>(GitGutterPrevHunk)', { noremap = true })
-- preview hunk
vim.keymap.set('n', '<Leader>ggP', '<Plug>(GitGutterPreviewHunk)', { noremap = true })
-- stage hunk
vim.keymap.set('n', '<Leader>ggs', '<Plug>(GitGutterStageHunk)', { noremap = true })
-- undo hunk
vim.keymap.set('n', '<Leader>ggu', '<Plug>(GitGutterUndoHunk)', { noremap = true })
-- toggle line highlights
vim.keymap.set('n', '<Leader>ggh', '<Plug>(GitGutterLineHighlightsToggle)', { noremap = true })
-- next/previous hunk
vim.keymap.set('n', ']]', ':silent! GitGutterNextHunk<Enter>', { noremap = true, silent = true })
vim.keymap.set('n', '[[', ':silent! GitGutterPrevHunk<Enter>', { noremap = true, silent = true })


-- Commentary
vim.keymap.set('n', 'gc', '<Plug>Commentary')
vim.keymap.set('x', 'gc', '<Plug>Commentary')
vim.keymap.set('o', 'gc', '<Plug>Commentary')
vim.keymap.set('n', 'gcc', '<Plug>CommentaryLine')
vim.keymap.set('n', 'gcu', '<Plug>Commentary<Plug>Commentary', { silent = true })


-- Trouble
local trouble = require('trouble')
vim.keymap.set('n', '<leader>xx', trouble.toggle)
vim.keymap.set('n', '<leader>xw', function() trouble.toggle('workspace_diagnostics') end)
vim.keymap.set('n', '<leader>xd', function() trouble.toggle('document_diagnostics') end)
vim.keymap.set('n', '<leader>xq', function() trouble.toggle('quickfix') end)
vim.keymap.set('n', '<leader>xl', function() trouble.toggle('loclist') end)
vim.keymap.set('n', 'gR',         function() trouble.toggle('lsp_references') end)

-- Noice
-- Dismiss noice
vim.keymap.set('n', '<Leader>nn', ':NoiceDismiss<Enter>', { noremap = true })

-- Navigation
-- barbar
vim.keymap.set('n', '<Leader>h', ':silent! BufferPrevious<Enter>', { noremap = true })
vim.keymap.set('n', '<Leader>l', ':silent! BufferNext<Enter>', { noremap = true })
vim.keymap.set('n', '<leader>k', ':silent! BufferClose<Enter>', { noremap = true })
vim.keymap.set('n', '<Leader>K', ':silent! BufferRestore<Enter>', { noremap = true })
vim.keymap.set('n', '<Leader>b', ':silent! BufferPick<Enter>', { noremap = true })
-- Regular navigation
vim.keymap.set('n', '<Leader>j', ':e<Space>', { noremap = true })

-- Non-plugin keybindings
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


-- Language specific keybindings
-- JS Insert debugger
vim.keymap.set('n', '<Leader>qd', 'odebugger;<esc>', { noremap = true })
vim.keymap.set('n', '<Leader>qD', 'Odebugger;<esc>', { noremap = true })


return { set_lsp_keymaps  = set_lsp_keymaps, }
