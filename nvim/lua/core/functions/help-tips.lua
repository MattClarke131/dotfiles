-- help tips
local helptips = {
-- nvim tree
  'Tree: \'g?\' for help',
  'Tree: \'a\' create',
  'n mode: \'nf\' open tree',
  'n mode: \'nf\' open tree',

-- commentary
  'gc comment',
  'gcc comment line',
  'gcu undo comment',
  'gcap comment paragraph',

-- lsp
  'LSP: n mode: \'gd\' go to definition',
  'LSP: n mode: \'gr\' references',
  'LSP: n mode: \'gi\' implementation',
  'LSP: n mode: \'gh\' hover-info',
  'LSP: n mode: \'rn\' rename',
  'LSP: n mode: \'ca\' code action',

-- telescope
  'TS: n mode: \'fp\' list registers',
  'TS: n mode: \'fcc\' commits',
  'TS: n mode: \'fcb\' buff commits',
  'TS: n mode: \'fr\' rg',
  'TS: n mode: \'fs\' rip string',
  'TS: n mode: \'fv\' vim options',
  'TS: n mode: \'fm\' keymaps',
  'TS: n mode: \'/\' rg buff',
  'TS: C-Q: open buff w/ results',

-- gitgutter
  'GG: n mode: \'ggn\' next hunk',
  'GG: n mode: \'ggp\' prev hunk',
  'GG: n mode: \'ggP\' preview hunk',
  'GG: n mode: \'ggs\' stage hunk',
  'GG: n mode: \'ggu\' undo hunk',
  'GG: n mode: \'ggh\' toggle gitgut',
  'GG: n mode: \']]\' next hunk',
  'GG: n mode: \'[[\' prev hunk',

  -- trouble
  'Trouble: \'xx\' toggle',
  'Trouble: \'xw\' workspace',
  'Trouble: \'xd\' document',
  'Trouble: \'xq\' quickfix',
  'Trouble: \'xl\' loclist',
  'Trouble: \'gR\' lsp refs (no leader)',
}

local function cycleHelpTip()
  math.randomseed(os.time())
  vim.g.help_tip = helptips[math.random(#helptips)]
end

cycleHelpTip()

return {
  cycleHelpTip = cycleHelpTip
}
