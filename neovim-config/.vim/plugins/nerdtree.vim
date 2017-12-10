" Open NerdTREE on right
let g:NERDTreeWinPos = "right"

" Open at starts up
autocmd vimenter * NERDTree

" Open with Ctrl + T
map <silent> <C-t> :NERDTreeToggle<CR>

" Close if it's the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open NerdTREE on every tabs
let g:nerdtree_tabs_open_on_console_startup=1
