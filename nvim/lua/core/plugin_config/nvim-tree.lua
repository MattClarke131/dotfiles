require('nvim-tree').setup {
  disable_netrw = true,
  hijack_netrw = true,
  view = {
    side = 'right',
    number = true,
  },
  renderer = {
    highlight_modified = 'icon',
    highlight_git = 'icon',
    highlight_opened_files = 'icon',
  },
  modified = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
  },
  update_focused_file = {
    enable = true,
  }
}
