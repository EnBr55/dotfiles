execute pathogen#infect()
syntax on
filetype plugin indent on
set number relativenumber
set clipboard=unnamedplus
let g:javascript_plugin_jsdoc = 1

" Tabs and shiftwidth
set tabstop=4
set shiftwidth=4

" use onedark color scheme, but keep terminal background color
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif
colorscheme onedark


" Key maps

nmap <F2> :NERDTreeToggle<CR>

" Guides
inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
map <leader><leader> <Esc>/<++><Enter>"_c4l

