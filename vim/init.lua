-- I forget, but I believe this has something to do with neoVim
vim.cmd([[
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
]])

-- Highlight yanked text
vim.api.nvim_exec([[
autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup='Visual', timeout=1000}
]], false)

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

require('lazy').setup({
    -- language processing and syntax
  'neovim/nvim-lspconfig',
  'github/copilot.vim',
  {'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    ensure_installed = { 'javascript' },
    highlight = {
      enable = true,
      -- additional_vim_regex_highlighting = false,
    },
    auto_install = true,
  },
  -- possibly unnecessary with treesitter
  -- 'leafgarland/typescript-vim',
  -- 'pangloss/vim-javascript',

  -- tools
  'scrooloose/nerdtree',
  'junegunn/fzf',
  -- 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  -- try fzf-lua
  -- https://github.com/ibhagwan/fzf-lua
  -- 'ibhagwan/fzf-lua'

  -- visual changes
  'airblade/vim-gitgutter',
  'ap/vim-buftabline',
})

-- Language Server Protocol
require'lspconfig'.tsserver.setup{}

vim.api.nvim_exec([[
" NERDTREE
  " OPTIONS
  " Close nerd tree on file open
      let NERDTreeQuitOnOpen = 1
  " Delete buffer if file is deleted with NERDTree
      let NERDTreeAutoDeleteBuffer = 1
  " MAPPING
      nnoremap <Leader>nf :NERDTreeToggle<Enter>
      nnoremap <silent> <Leader>nv :NERDTreeFind<Enter>


" FZF
  " MAPPING
      nnoremap <Leader>ff :FZF<Enter>
      nnoremap <Leader>fb :Buffers<Enter>
      nnoremap <Leader>fh :History<Enter>
      nnoremap <Leader>fc :Commands
      nnoremap <Leader>fm :Maps

" GITGUTTER
  " disable default keybindings
      let g:gitgutter_map_keys=0
  " MAPPING
  " wanted default mappings
      nmap ]c <Plug>(GitGutterNextHunk)
      nmap [c <Plug>(GitGutterPrevHunk)
  " git hunk preview
      nmap <Leader>gp <Plug>(GitGutterPreviewHunk)
  " git hunk stage
      nmap <Leader>gs <Plug>(GitGutterStageHunk)
  " git hunk undo
      nmap <Leader>gu <Plug>(GitGutterUndoHunk)
  " git highlight
      nmap <Plug>(GitGutterLineHightlightsToggle) :GitGutterLineHighlightsToggle<CR>
      nmap <Leader>gh <Plug>(GitGutterLineHightlightsToggle)

  " unwanted default mappings
      nmap \hu nop

" VIM FUGITIVE
  " git blame
      nmap <Leader>gb :Git blame<CR>
]], false)
