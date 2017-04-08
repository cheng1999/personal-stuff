let mapleader = ","

" Setting {
  " Enable syntax highlighting
  syntax on

  " Enable use of the mouse for all modes
  set mouse=a
  
  " Clipboard
    if has('clipboard')
      if has('unnamedplus')  " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
      else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
      endif
    endif

  " Use case insensitive search, except when using capital letters
  set ignorecase
  set smartcase

  " Highlight search results
  set hlsearch

  " Allow backspacing over autoindent, line breaks and start of insert action
  set backspace=indent,eol,start
   
  " When opening a new line and no filetype-specific indenting is enabled, keep
  " the same indent as the line you're currently on. Useful for READMEs, etc.
  set autoindent

  " Display line numbers on the left
  set number

  " Tab
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set smarttab
  set expandtab

  " Folding
  set foldmethod=indent
  set foldnestmax=3
  set foldlevel=0
" }

" Plug {
" Vim-Plug Setup {
  call plug#begin('~/.vim/plugged')
  " let Vundle manage Vundle, required
  Plug 'VundleVim/Vundle.vim'

  " The following are examples of different formats supported.
  " Keep Plug commands between vundle#begin/end.
  " plugin on GitHub repo
  Plug 'Shougo/neocomplete.vim'
  Plug 'mbbill/undotree'
  Plug 'scrooloose/nerdtree'
  Plug 'easymotion/vim-easymotion'
  "Plug 'ctrlpvim/ctrlp.vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'Shougo/vimproc.vim', {'do': 'make'} | Plug 'Shougo/vimshell.vim'
  Plug 'vim-syntastic/syntastic'
  "Plug 'w0rp/ale'
  Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer'} " , 'for': ['clang']}
  Plug 'majutsushi/tagbar'
  Plug 'junegunn/limelight.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'nathanaelkane/vim-indent-guides'

  " Themes
  Plug 'jnurmine/Zenburn'
  Plug 'tyrannicaltoucan/vim-quantum'
  Plug 'altercation/vim-colors-solarized'
  
  " Add plugins to &runtimepath
  call plug#end()

" Plug Conf {
  " Undotree 
    if has("persistent_undo")
    set undodir=~/.vim/undodir/
        set undofile
    endif
    " If undotree is opened, it is likely one wants to interact with it.
    let g:undotree_SetFocusWhenToggle=1

  " NERD Tree 
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    let g:NERDTreeDirArrowExpandable = '▸'
    let g:NERDTreeDirArrowCollapsible = '▾'

  " Easy Motion
    " <Leader>f{char} to move to {char}
    map  <Leader>f <Plug>(easymotion-bd-f)
    nmap <Leader>f <Plug>(easymotion-overwin-f)

    " s{char}{char} to move to {char}{char}
    nmap s <Plug>(easymotion-overwin-f2)

    " Move to line
    map <Leader>L <Plug>(easymotion-bd-jk)
    nmap <Leader>L <Plug>(easymotion-overwin-line)

    " Move to word
    map  <leader>w <plug>(easymotion-bd-w)
    nmap <Leader>w <Plug>(easymotion-overwin-w)

  " Neo Complete
    let g:neocomplete#enable_at_startup = 1
  
  " YouCompleteMe
    "let g:ycm_show_diagnostics_ui = 0
    let g:ycm_always_populate_location_list = 1
    "Youcompleteme fix
    let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

  " ALE
    "set statusline+=%{ALEGetStatusLine()}
    "let g:ale_lint_on_save = 1
    "let g:ale_lint_on_text_changed = 0
    "let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
    "let g:airline_section_error = airline#section#create_right(['ALE'])
  " Syntastic
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0  
    let g:syntastic_jeavascript_checkers = ['jshint']
    "let g:syntastic_javascript_checkers = ['eslint']
    "let g:syntastic_javascript_eslint_exec = 'eslint_d'

  " Vim auto close
    let g:autoclose_vim_commentmode = 1

  " Vim Shell
    let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
    let g:vimshell_prompt = '$ '
  " Vim airline
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts=1
" }
" }

" Interface {
  set laststatus=2
  set cursorline
  set cursorcolumn
  if has('gui_running')
    set background=dark
    colorscheme quantum
    set guioptions=i
    set guifont=Hack\ Regular\ 10
  else
    set t_Co=16
    "colorscheme zenburn
    "highlight Normal ctermbg=none
  endif
" } 

" Key mapping {
  map <C-u> <ScrollWheelUp>
  map <C-d> <scrollwheeldown>
  map <leader><leader>u :UndotreeToggle<CR>
  map <C-e> :NERDTreeToggle<CR>
  nmap <F8> :TagbarToggle<CR>
  
  " Motion under insert mode
  inoremap <C-h> <C-o>h
  inoremap <C-j> <C-o>j
  inoremap <C-k> <C-o>k
  inoremap <C-l> <C-o>l
  inoremap <C-b> <C-o>b
  inoremap <C-w> <C-o>w
  inoremap <C-e> <C-o>e
" }
