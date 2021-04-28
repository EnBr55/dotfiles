execute pathogen#infect()
syntax on
filetype plugin indent on
set number relativenumber
"set clipboard=unnamedplus
set clipboard^=unnamed
let g:javascript_plugin_jsdoc = 1
let mapleader = " "
let g:airline_theme='one'

if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

"colorscheme one
"set background=dark
"set background=light
" set background=dark " for the dark version
"set background=light " for the light version
"

"call one#highlight('vimLineComment', '9f9f9f', '', 'none')
"call one#highlight('vimLineComment', '9f9f9f', '', 'none')
"call one#highlight('Comment', '9f9f9f', '', 'none')
"
"call one#highlight('*', '', '' none)

" Tabs and shiftwidth
set tabstop=2
set shiftwidth=2
set expandtab

autocmd FileType c set tabstop=4
autocmd FileType c set shiftwidth=4

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

" Find color names here: https://github.com/joshdick/onedark.vim/blob/master/colors/onedark.vim
let g:onedark_color_overrides = {
\ "comment_grey": {"gui": "#9f9f9f", "cterm": "235", "cterm16": "0" },
\ "gutter_fg_grey": {"gui": "#9f9f9f", "cterm": "235", "cterm16": "0" }
\}

colorscheme onedark

call onedark#extend_highlight('Comment', {})

" Autocompile .tex files whenever we write to them
"autocmd BufWritePost *.tex silent! Dispatch! latexmk % -pdf -pvc -view=none -interaction=batchmode 
"autocmd BufWritePost *.tex silent! Dispatch! latexmk -c > /tmp/tmplatex.txt
"&& silent! latexmk -c > /tmp/tmplatex.txt || latexmk -c > /tmp/tmplatex.txt
"autocmd BufWritePost *.tex silent! Dispatch! latexmk -c > /tmp/tmplatex.txt
"
autocmd BufEnter *.tex let b:dispatch='latexmk % -pdf -pvc -interaction=batchmode'
autocmd BufWritePost *.tex silent! Dispatch! 
"autocmd BufReadPost,BufNewfile *.tex silent! Dispatch! latexmk % -pdf -pvc -interaction=batchmode -view=none
autocmd VimLeave *.tex !latexmk % -pdf -interaction=batchmode ; latexmk -c > /tmp/tmplatex.txt
autocmd BufWritePost *.md silent! Dispatch! pandoc -o %:r.pdf % > /tmp/tmplatex.txt

" Key maps

nmap <leader>c :Dispatch! latexmk % -pdf -pvc -interaction=batchmode
nmap <F2> :NERDTreeToggle<CR>
nmap <leader>a :ALEToggle<Enter>

" Guides
"inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
map <leader><leader> <Esc>/<++><Enter>"_c4l

" Latex live preview
nmap <leader>l :silent <space>!pwd<space><bar><space>awk<space>'{print $1"/%"}'<space><bar><space>sed<space>'s/[.].*$/.pdf/'<space><bar><space>xargs<space>zathura<space>2>/dev/null<space>&<Enter>


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

hi Normal guibg=NONE ctermbg=NONE

" UltiSnips setup
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

let g:tex_flavor='latex'
set conceallevel=1
let g:tex_conceal='abdmg'

inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>

" Vim default
let g:Hexokinase_highlighters = [ 'sign_column', 'backgroundfull' ]

" Patterns to match for all filetypes
" Can be a comma separated string or a list of strings
" Default value:
let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla,colour_names'

" Filetype specific patterns to match
" entry value must be comma seperated list
let g:Hexokinase_ftOptInPatterns = {
\     'css': 'full_hex,rgb,rgba,hsl,hsla,colour_names',
\     'html': 'full_hex,rgb,rgba,hsl,hsla,colour_names'
\ }

" Sample value, to keep default behaviour don't define this variable
" let g:Hexokinase_ftEnabled = ['css', 'html', 'javascript']
