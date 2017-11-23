if &compatible
	set nocompatible
endif

syntax on
set termguicolors
colorscheme gruvbox
set background=dark

hi Normal guibg=NONE ctermbg=NONE

set t_Co=256
set relativenumber
set number
set autoindent
set tabstop=2
set shiftwidth=2
set cursorcolumn
set cursorline

source ~/.config/nixpkgs/neovim-config/.vim/plugins/plugins.vim
