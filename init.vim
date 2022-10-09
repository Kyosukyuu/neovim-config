" search recursively downward from CWD and tab completion for filenames
set path+=**

" check line numbers for file-specific vars
set modelines=0

" LINE NUMBERS
" adds numbered lines
set number
" set numbered lines relative to current line
set relativenumber
" show matching brackets
set showmatch

" set encoding to UTF-8
set encoding=utf-8

" use system clipboard
set clipboard=unnamedplus

" vim command autocompletion
set wildmenu wildmode=list:longest,full

" enable mouse for all modes
set mouse=a

"make scrolling and painting fast for performance
set lazyredraw

" reload files outside of nvim
set autoread
au FocusGained,BufEnter * :silent! !

" TABS
" converts tabs to whitespace
set expandtab 
" number of columns occupied by a tab
set tabstop=2 
" width for autoindents
set shiftwidth=2
" number of spaces the cursor moves to the right from a tab
set softtabstop=2
" new lines will autoindent to match the previous line
set autoindent 

" SEARCH
" highlights search results
set hlsearch
" incremental search
set incsearch
" case insensitive
set ignorecase
" overrides case insensitivity if search has uppercase letters
set smartcase

" LINE FOLDS
set foldmethod=indent
set foldnestmax=1
set foldlevelstart=1

set showmode showcmd
set laststatus=2 statusline=%F

" disable temp files
set noswapfile

syntax enable

" PROVIDERS (CONSULT :checkhealth provider) 
let g:python3_host_prog = 'C:\Users\KEVIN_ZHONG\AppData\Local\Programs\Python\Python310\python.exe'

" PLUGINS
filetype plugin on

call plug#begin()
" THEMING
" tokyonight neovim color scheme
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
" lua-based status line
Plug 'nvim-lualine/lualine.nvim'
" color code highlighting
Plug 'brenoprata10/nvim-highlight-colors'
" devicons
Plug 'kyazdani42/nvim-web-devicons'

" LSP
" native neovim LSP
Plug 'neovim/nvim-lspconfig'
" syntax highlighting and more
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
" general-case language server for formatters and diagnostics
Plug 'jose-elias-alvarez/null-ls.nvim'
" light-weight LSP plugin with UI implementations
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }

" LSP AUTOCOMPLETION
" completion engine for neovim
Plug 'hrsh7th/nvim-cmp'
" nvim-cmp source for native LSP
Plug 'hrsh7th/cmp-nvim-lsp'

" snippet engine for neovim
Plug 'L3MON4D3/LuaSnip'
" luasnip for nvim-cmp
Plug 'saadparwaiz1/cmp_luasnip'

" nvim-cmp source for buffer words
Plug 'hrsh7th/cmp-buffer'
" nvim-cmp source for vim's command-line
Plug 'hrsh7th/cmp-cmdline'
" nvim-cmp source for filesystem paths
Plug 'hrsh7th/cmp-path'

" VS-code-like pictograms for native LSP
Plug 'onsails/lspkind-nvim'
" neovim lua library that provides useful general-case development utilities
Plug 'nvim-lua/plenary.nvim'

" FORMATTING
" auto-close and rename tags
Plug 'windwp/nvim-ts-autotag'
" autopair plugin
Plug 'windwp/nvim-autopairs'
" provides mappable comment / uncomment functions
Plug 'preservim/nerdcommenter'
" prettier plugin for neovim's native LSP
Plug 'MunifTanjim/prettier.nvim'

" NAVIGATION
" list fuzzy finder (also download BurntSushi/ripgrep and sharkdp/fd)
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
" native telescope sorter to improve telescope performance
Plug 'nvim-telescope/telescope-fzy-native.nvim'
" file-browser extension for telescope.nvim with support for file and directory actions
Plug 'nvim-telescope/telescope-file-browser.nvim'
call plug#end()

lua << EOF
require('lualine-theme')
require('lsp-setup')
require('telescope-setup')
require('color-highlighter')
require('formatting')
require('tokyonight').setup({
  style = 'storm',
  terminal_colors = true
})
EOF

" TERMINAL COLORSCHEME
colorscheme tokyonight
set termguicolors

" SET TERMINAL TO USE POWERSHELL 
" (MAKE SURE YOU HAVE POWERSHELL, NOT WINDOWS POWERSHELL!)
set shell=pwsh.exe
set shellxquote=
let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command '
let &shellquote   = ''
let &shellpipe    = '| Out-File -Encoding UTF8 %s'
let &shellredir   = '| Out-File -Encoding UTF8 %s'

" MAPPINGS / RE-MAPPINGS
" TERMINAL
" escape from terminal
tnoremap <leader><Esc> <C-\><C-n>
" refresh / reload terminal
nnoremap <leader>r <cmd>so %<cr>

" TELESCOPE
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({ hidden = true })<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
" nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fb <cmd>lua require('telescope').extensions.file_browser.file_browser({ hidden = true })<cr>

