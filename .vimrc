execute pathogen#infect()
syntax on
filetype plugin indent on
set number relativenumber
"set clipboard=unnamedplus
set clipboard^=unnamed
let g:javascript_plugin_jsdoc = 1
let mapleader = " "

" Tabs and shiftwidth
set tabstop=2
set shiftwidth=2
set expandtab

" Set thesaurus
set thesaurus+=/home/ben/.vim/mthesaur.txt
autocmd FileType text,markdown,latex,tex,plaintex setlocal spell
" Swap gj, j and gk, k for text files
autocmd FileType text,markdown,latex,tex,plaintex nnoremap j gj
autocmd FileType text,markdown,latex,tex,plaintex noremap k gk
" Remove character limit for syntax highlighting in text files.
autocmd FileType text,markdown,latex,tex,plaintex set synmaxcol=0
" For joplin notes
autocmd FileType markdown set backupcopy=yes

" Linting and autocompleting stuff
" Java
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" Typescript
autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript

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
autocmd BufWritePost *.tex Dispatch! latexmk % -pdf -interaction=batchmode && latexmk -c
autocmd BufWritePost *.md Dispatch! pandoc -o %:r.pdf %

" Key maps

nmap <F2> :NERDTreeToggle<CR>
nmap <leader>a :ALEToggle<Enter>

" Guides
"inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
map <leader><leader> <Esc>/<++><Enter>"_c4l

" Latex live preview
nmap <leader>l :silent<space>!pwd<space><bar><space>awk<space>'{print $1"/%"}'<space><bar><space>sed<space>'s/[.].*$/.pdf/'<space><bar><space>xargs<space>zathura<space>2>/dev/null<space>&<Enter>


" Make explore commands look better
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" Make autocomplete nicer
" select longest common text of all matches (instead of just first match)
set completeopt=longest,menuone
" make enter autofill the selection
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" always keep a menu item highlighted
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Shortcut ctrl-b to autocomplete
imap <C-b> <C-X><C-O><C-N>

" UltiSnips setup
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
