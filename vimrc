"mclarke vimrc

" VIM PLUG BUNDLER
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -flo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif


" BUNDLES / PLUGINS
  call plug#begin('~/.vim/bundle')
    Plug 'scrooloose/nerdtree'
  call plug#end()


" DISPLAY
  " displays whitespace characters
      if has("patch-7.4.710")
        set listchars+=space:·,eol:¬,tab:>-
      else
        set listchars+=eol:¬,tab:>-
      endif
      set list
  " displays status line always
      set laststatus=2
  " displays line numbers
      set number
  " highlight matching parentheses / brackets
      set showmatch


" FORMATTING
  " auto indent
      set autoindent
  " 4 spaces instead of tabs
      set shiftwidth=4
      set softtabstop=4
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


" MAPPING
  " Switch ; and : mappin in normal mode
      nnoremap ; :
      nnoremap : ;
  " bind 'kj' to esc. `^ is to keep cursor in it's position
      inoremap kj <esc>`^
