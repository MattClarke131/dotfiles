"mclarke vimrc

" VIM PLUG BUNDLER INIT
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -flo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif

" CHECK FOR AND INSTALL PLUGINS
  autocmd VimEnter *
    \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \|   PlugInstall --sync | q
    \| endif


" BUNDLES / PLUGINS
  call plug#begin('~/.vim/bundle')
    Plug 'scrooloose/nerdtree'
    Plug 'airblade/vim-gitgutter'
  call plug#end()

" GITGUTTER
  " MAPPING
  " wanted default mappings
      nmap ]c <Plug>(GitGutterNextHunk)
      nmap [c <Plug>(GitGutterPrevHunk)
    " hunk preview
      nmap <Leader>hp <Plug>(GitGutterPreviewHunk)
    " hunk stage
      nmap <Leader>hs <Plug>(GitGutterStageHunk)
    " git highlight
      nmap <Plug>(GitGutterLineHightlightsToggle) :GitGutterLineHighlightsToggle<CR>
      nmap <Leader>gh <Plug>(GitGutterLineHightlightsToggle)

  " unwanted default mappings
      nmap \hu nop

" MAPPING
  " Switch ; and : mappin in normal mode
      " nnoremap ; :
      " nnoremap : ;
  " bind 'kj' to esc. `^ is to keep cursor in it's position
      inoremap kj <esc>`^
  " bind 'lkj' to esc and save.
      inoremap lkj <esc>`^:w<CR>
      nnoremap lkj :w<CR>
  " bind ';lkj' to esc and save.
      inoremap ;lkj <esc>`^:wq<CR>
      nnoremap ;lkj :wq<CR>


" BEHAVIOR
  " Controls how quickly vim write a swp file (among other things)
    set updatetime=100


" NAVIGATION"
  " keeps lines above and below when scrolling
      set scrolloff=20
  " use mouse for navigation
      set mouse=a


" DISPLAY
  " displays command always
      set showcmd
  " displays whitespace characters
"      if has("patch-7.4.710")
"        set listchars+=space:·,eol:¬,tab:>-
"      else
"        set listchars+=eol:¬,tab:>-
"      endif
"      set list
  " displays status line always
      set laststatus=2
  " displays line numbers
      set number
  " highlight matching parentheses / brackets
      set showmatch
  " syntax highlighting
      syntax on


" FORMATTING
  " auto indent
      set autoindent
  " 2 spaces instead of tabs
      set shiftwidth=2
      set softtabstop=2
      set expandtab
  " spellchecking
      set spelllang=en-us


" SEARCH
  " use case insensitive search, except when using capital letters
      set ignorecase
      set smartcase
  " search as characters are entered
      set incsearch
  " highlight matches
      set hlsearch
  " unhighlight matches on pressing enter
      nnoremap <silent> <CR> :nohls<CR><CR>

" VIM COMMANDS
  " Hitting TAB in command mode will show possible completions
    set wildmenu
    set wildchar=<TAB>
    set wildmode=list:longest,full
    set wildignore+=*.DS_STORE,*.db,node_modules/**,*.jpg,*.png,*.gif

" SOURCE LOCAL VIMRC
try
  so $HOME/.vim/vimrc.local
catch
endtry
