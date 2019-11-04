execute pathogen#infect()
syntax on
filetype plugin indent on
set number relativenumber
set clipboard=unnamedplus
let g:javascript_plugin_jsdoc = 1
let mapleader = " "

" Tabs and shiftwidth
set tabstop=2
set shiftwidth=2

" use onedark color scheme, but keep terminal background color
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif
colorscheme onedark

" Autocompile .tex files whenever we write to them
autocmd BufWritePost *.tex Dispatch! latexmk % -pdf

" Key maps

nmap <F2> :NERDTreeToggle<CR>

" Guides
inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
map <leader><leader> <Esc>/<++><Enter>"_c4l

" Make explore commands look better
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

