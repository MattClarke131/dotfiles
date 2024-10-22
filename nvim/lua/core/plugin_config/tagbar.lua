vim.g.tagbar_autofocus = 1
vim.g.tagbar_case_insensitive = 1
vim.g.tagbar_wrap = 1
vim.g.tagbar_sort = 0



vim.cmd('autocmd VimEnter * nested :call tagbar#autoopen(1)')
