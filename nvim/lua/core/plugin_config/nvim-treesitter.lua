require('nvim-treesitter').setup {
  ensure_installed = {
  'javascript', 'jsx', 'typescript', 'tsx', 'json', 'lua', 'python', 'c', 'vim', 'zsh', 'bash', 'dockerfile', 'html', 'css', 'scss', 'yaml', 'scheme', 'lisp'
  },
  highlight = {
    enable = true,
  },
  auto_install = true,
}
