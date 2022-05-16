syntax on

set nu rnu
set ignorecase
set mouse=v
set mouse=
set nowrap
set noerrorbells

set nohlsearch
set incsearch

" Autocomplete
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete

" Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set scrolloff=8

" Files
set wildmode=longest,list,full
set wildmenu
set path+=**
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

" Remapping
nnoremap <SPACE> <Nop>
let mapleader=" "

noremap <leader>pv :Vex<cr>
noremap <leader>w :w<cr>
nnoremap <leader><leader> <C-^>
nnoremap Y yy
nnoremap n nzz
nnoremap N Nzz

set updatetime=300
set noswapfile
set nobackup
set nowritebackup

set clipboard=unnamed
if has("unnamedplus")
	set clipboard+=unnamedplus
endif

filetype plugin on
filetype plugin indent on

" Plugins
call plug#begin("~/.vim/plugged")
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make'}
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-pat'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'saadparwaiz1/cmp_luasnip'
  Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'mfussenegger/nvim-jdtls'
  Plug 'williamboman/nvim-lsp-installer'
call plug#end()

lua require('wayneblink')

" vim-go
let g:go_highlight_functions=1
let g:go_highlight_methods=1
let g:go_highlight_operators=1
let g:go_highlight_extra_types=1
let g:go_highlight_string_spellcheck=1
let g:go_auto_type_info=1

" Telescope
nnoremap <leader>/ <cmd>lua require('wayneblink.telescope').curr_buff() <cr>
nnoremap <leader>ff <cmd>lua require('wayneblink.telescope').find_files() <cr>
nnoremap <leader>fg <cmd>lua require('wayneblink.telescope').live_grep() <cr>
nnoremap <leader>fb <cmd>lua require('wayneblink.telescope').buffers() <cr>
nnoremap <leader>fh <cmd>lua require('wayneblink.telescope').help_tags() <cr>
