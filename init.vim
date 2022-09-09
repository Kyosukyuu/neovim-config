set number                  " adds numbered lines
set showmatch               " show matching brackets
set encoding=utf-8          " set encoding to UTF-8
set clipboard=unnamedplus   " use system clipboard
set wildmenu wildmode=list:longest,full
set mouse=a                 " enable mouse for all modes
set lazyredraw              " make scrolling and painting fast

set expandtab               " converts tabs to whitespace
set tabstop=4               " number of columns occupied by a tab
set shiftwidth=4            " width for autoindents
set softtabstop=4           " see multiple spaces as tabstops
set autoindent              " new lines will autoindent to match the previous line

set hlsearch                " highlights search result
set incsearch               " incremental search
set ignorecase              " case insensitive
set smartcase               " overrides case insensitivity if search has uppercase letters

set foldmethod=indent
set foldnestmax=1
set foldlevelstart=1

set noswapfile              " disable temp files

syntax enable

" PLUGINS

" starts neovim with NERDTree panel open and focused on next pane
autocmd VimEnter * NERDTree | wincmd p

call plug#begin()

Plug 'preservim/nerdtree'   " terminal-based, tree-view file explorer


call plug#end()
