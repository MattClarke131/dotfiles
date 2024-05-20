-- Language server
-- Keybindings for LSP
-- bound upon attaching to a buffer
local on_attach = function (_, bufnr)
  vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, { buffer = bufnr })
  vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, { buffer = bufnr })

  vim.keymap.set('n', '<Leader>gd', vim.lsp.buf.definition, { buffer = bufnr })
  vim.keymap.set('n', '<Leader>gi', vim.lsp.buf.implementation, { buffer = bufnr })
  vim.keymap.set('n', '<Leader>gh', vim.lsp.buf.hover, { buffer = bufnr })
end

-- Nvim tree
vim.keymap.set('n', '<Leader>nf', ':NvimTreeToggle<Enter>', { noremap = true })


-- Telescope
local builtin = require('telescope.builtin')
-- Find files
vim.keymap.set('n', '<Leader>ff', builtin.find_files)
-- Find buffers
vim.keymap.set('n', '<Leader>fb', builtin.buffers)
-- Find lines with rg
vim.keymap.set('n', '<Leader>fr', builtin.live_grep)
-- Find Lines in current buffer
vim.keymap.set('n', '<Leader>/', function()
  builtin.current_buffer_fuzzy_find { previewer=false }
end, { silent=true })
vim.keymap.set('n', '<Leader>f/', function()
  builtin.current_buffer_fuzzy_find { previewer=false }
end, { silent=true })
-- Find commands
vim.keymap.set('n', '<Leader>fc', builtin.commands)
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

-- Navigation
-- Quick buffer navigation
vim.keymap.set('n', '<Leader>l', ':bnext<Enter>', { noremap = true })
vim.keymap.set('n', '<Leader>h', ':bprev<Enter>', { noremap = true })
vim.keymap.set('n', '<Leader>j', ':e<Space>', { noremap = true })
vim.keymap.set('n', '<Leader>k', ':bd<Enter>', { noremap = true })

-- Language specific keybindings
-- JS Insert debugger
vim.keymap.set('n', '<Leader>qd', 'odebugger;<esc>', { noremap = true })
vim.keymap.set('n', '<Leader>qD', 'Odebugger;<esc>', { noremap = true })

return { on_attach  = on_attach }
