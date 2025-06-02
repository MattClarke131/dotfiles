-- ignore case when searching, except when using capital letters
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- search as characters are entered
vim.opt.incsearch = true

-- highlight matches
vim.opt.hlsearch = true

-- unhighlight matches on pressing enter
vim.keymap.set('n', '<CR>', ':nohls<CR><CR>', { noremap = true, silent = true })

-- Grep configuration
local exclude_dirs = {
  'node_modules',
  '.git',
  '__pycache__',
  '.venv',
}
if vim.fn.executable('rg') == 1 then
  -- Use ripgrep for searching
  local rg_exclude_args = {}
  for _, dir in ipairs(exclude_dirs) do
    table.insert(rg_exclude_args, '--glob=!' .. dir)
  end

  vim.opt.grepprg = 'rg --vimgrep --no-heading --smart-case --follow '.. table.concat(rg_exclude_args, ' ')
  vim.opt.grepformat = '%f:%l:%c:%m,%f:%l:%m'
else
  -- Fallback to grep if ripgrep is not available
  local exclude_args = {}
  for _, dir in ipairs(exclude_dirs) do
    table.insert(exclude_args, '--exclude-dir=' .. dir)
  end

  vim.opt.grepprg = 'grep -nH ' .. table.concat(exclude_args, ' ') .. ' $*'
  vim.opt.grepformat = '%f%l:%c:%m,%f:%l:%m'
end
