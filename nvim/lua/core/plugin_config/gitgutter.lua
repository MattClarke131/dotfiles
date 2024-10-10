-- No requiring of gitgutter, because it is written in vimscript, not lua
-- Disable default keybindings
vim.g.gitgutter_map_keys = 0
-- Enable GitGutter line number highlights
vim.cmd('GitGutterLineNrHighlightsEnable')
-- Enable GitGutter line highlights
vim.cmd('GitGutterLineHighlightsDisable')
-- Enable GitGutter signs
vim.cmd('GitGutterSignsEnable')

-- Define symbols for added, modified, and removed lines
vim.g.gitgutter_sign_added = '+'
vim.g.gitgutter_sign_modified = '~'
vim.g.gitgutter_sign_removed = '-'
