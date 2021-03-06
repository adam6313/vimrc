" vimrc
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker :

set nocompatible        " Must be first line

" plugin {
call plug#begin('~/.vim/plugged')

" basic
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
Plug 'gorodinskiy/vim-coloresque'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/matchit.zip'
Plug 'luochen1990/rainbow'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'shougo/denite.nvim'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'benmills/vimux-golang'

" colorscheme
"Plug 'fatih/molokai'
Plug 'morhetz/gruvbox'

" lint, autocomplete
Plug 'w0rp/ale'
Plug 'shougo/neocomplete.vim'
Plug 'honza/vim-snippets'

" language
Plug 'elzr/vim-json'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'alvan/vim-closetag'
Plug 'plasticboy/vim-markdown'
Plug 'uarun/vim-protobuf'

" javascript jsx
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'vim-scripts/JavaScript-Indent'
Plug 'mxw/vim-jsx'
"Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

" vue
Plug 'posva/vim-vue', { 'for': 'vue' }
Plug 'digitaltoad/vim-pug'

" html css
Plug 'cakebaker/scss-syntax.vim'

call plug#end()
" }

" General {
set background=dark             " Assume a dark background
set mouse=a                     " Automatically enable mouse usage
set mousehide                   " Hide the mouse cursor while typing
set showcmd                     " Show partial commands in status line and
set ruler                       " Show the ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
set laststatus=2
set updatetime=100

set showmode
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set cursorline
set number                      " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set history=1000                " Store a ton of history (default is 20)
set hidden                      " Allow buffer switching without saving
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current

set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)

if isdirectory(expand("~/.vim/plugged/gruvbox/"))
    colorscheme gruvbox
else
    colorscheme slate
endif

if has('clipboard')
    if has('unnamedplus')
        set clipboard=unnamed,unnamedplus
    else
        set clipboard=unnamed
    endif
endif

filetype plugin indent on        " Automatically detect file types.
syntax on                        " Syntax highlighting

" set file type
autocmd BufNewFile,BufRead .eslintrc set filetype=json
autocmd BufNewFile,BufRead .babelrc set filetype=json
autocmd BufNewFile,BufRead *.vue setlocal filetype=vue

" set tab
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType json setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType vue setlocal tabstop=2 shiftwidth=2 expandtab

let mapleader = ',' " Replace leader to ',', default leader is '\'

" }

" Directory {
" store swapfiles in a central location
set directory=~/.vim/tmp/swap//
if !isdirectory(&directory)
  call mkdir(&directory, 'p')
endif

" enable backup
set backup                      " Backups are nice ...
set backupdir=~/.vim/tmp/backup//
if !isdirectory(&backupdir)
    call mkdir(&backupdir, 'p')
endif

" enable persistent undo
if has('persistent_undo')
    set undofile
    set undolevels=1000         " Maximum number of changes that can be undone
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
    set undodir=~/.vim/tmp/undo//

    if !isdirectory(&undodir)
        call mkdir(&undodir, 'p')
    endif
endif
" }

" # Plugin settings

" NERDTree {
map <C-n> :NERDTreeToggle<CR>
nmap <leader>nf :NERDTreeFind<CR>

let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" }

" Airline {
let g:airline_theme = 'cool'
let g:airline_left_sep='⟩'  " Slightly fancier than '>'
let g:airline_right_sep='⟨' " Slightly fancier than '<'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '⟩'
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#excludes = [ 'tagbar' ]
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
" }

" vim indent guides {
if isdirectory(expand("~/.vim/plugged/vim-indent-guides/"))
    let g:indent_guides_start_level = 2
    "let g:indent_guides_guide_size = 1
    let g:indent_guides_enable_on_vim_startup = 1
endif
" }

" Neo complete {
if isdirectory(expand("~/.vim/plugged/neocomplete.vim"))
    let g:acp_enableAtStartup = 0
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_smart_case = 1

    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      "return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
      " For no inserting <CR> key.
      return pumvisible() ? "\<C-y>" : "\<CR>"
    endfunction
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

    " <TAB>: completion.
    inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    "autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=tern#Complete

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
        let g:neocomplete#sources#omni#input_patterns = {}
    endif
    let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
    let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
endif
" }

" inoremap <expr><CR> neosnippet#expandable() ? neosnippet#mappings#expand_or_jump_impl() : pumvisible() ? neocomplete#close_popup() : "\<CR>"

" Ale {
let g:ale_completion_enabled = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_fixers = {
  \ 'javascript': ['eslint']
  \ }
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1
" }

" golang {
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
"au FileType go nmap <Leader>s <Plug>(go-implements)
"au FileType go nmap <Leader>i <Plug>(go-info)
"au FileType go nmap <Leader>e <Plug>(go-rename)
"au FileType go nmap <leader>r <Plug>(go-run)
"au FileType go nmap <leader>b <Plug>(go-build)
"au FileType go nmap <leader>t <Plug>(go-test)
"au FileType go nmap <Leader>gd <Plug>(go-doc)
"au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
"au FileType go nmap <leader>co <Plug>(go-coverage)
" }

" close tag {
let g:closetag_filetypes = 'html,jsx,javascript'
" }

" Tabularize {
if isdirectory(expand("~/.vim/plugged/tabular"))
    nmap <Leader>a& :Tabularize /&<CR>
    vmap <Leader>a& :Tabularize /&<CR>
    nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
    vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
    nmap <Leader>a=> :Tabularize /=><CR>
    vmap <Leader>a=> :Tabularize /=><CR>
    nmap <Leader>a: :Tabularize /:<CR>
    vmap <Leader>a: :Tabularize /:<CR>
    nmap <Leader>a:: :Tabularize /:\zs<CR>
    vmap <Leader>a:: :Tabularize /:\zs<CR>
    nmap <Leader>a, :Tabularize /,<CR>
    vmap <Leader>a, :Tabularize /,<CR>
    nmap <Leader>a,, :Tabularize /,\zs<CR>
    vmap <Leader>a,, :Tabularize /,\zs<CR>
    nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
endif
" }

" TagBar {
if isdirectory(expand("~/.vim/plugged/tagbar"))
    nnoremap <silent> <leader>t :TagbarToggle<CR>
    let g:tagbar_type_markdown = {
        \ 'ctagstype' : 'markdown',
        \ 'kinds' : [
            \ 'h:Heading_L1',
            \ 'i:Heading_L2',
            \ 'k:Heading_L3'
        \ ]
    \ }
endif
"}

" rainbow {
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \   'operators': '_,\|:=\|!=\|==_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}
" }

" vimux {
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>
" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>
" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>
" Interrupt any command running in the runner pane
map <Leader>vx :VimuxInterruptRunner<CR>
" Zoom the runner pane (use <bind-key> z to restore runner pane)
map <Leader>vz :call VimuxZoomRunner()<CR>
" }

" json {
let g:vim_json_syntax_conceal = 0
" }

" markdown {
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
" }

" Denite {
if isdirectory(expand("~/.vim/plugged/denite.nvim"))
    nnoremap <silent> <leader>b :<C-u>Denite buffer -mode=normal<CR>
    nnoremap <silent> <leader>/ :<C-u>Denite grep -no-empty -mode=normal <CR>
    nnoremap <silent> <leader>f :<C-u>Denite file_rec<CR>
    "nnoremap <silent> <leader>u :<C-u>Denite buffer file_old<CR>
    nnoremap <silent> <leader>o :<C-u>Denite outline -no-quit -mode=normal<CR>
    nnoremap <silent> <leader>h :<C-u>Denite help<CR>
    nnoremap <silent> <leader>r :<C-u>Denite register<CR>
    nnoremap <silent> <leader>l :<C-u>Denite line<CR>
    nnoremap <silent> <leader>! :<C-u>Denite -resume<CR>

    call denite#custom#map('insert', '<C-[>', '<denite:enter_mode:normal>', 'noremap')
    call denite#custom#map('normal', '<C-[>', '<denite:quit>', 'noremap')

    " Add custom menus
    let s:menus = {}

    let s:menus.zsh = {
        \ 'description': 'Edit zsh configuration'
        \ }
    let s:menus.zsh.file_candidates = [
        \ ['zshrc', '~/.zshrc'],
        \ ]
    let s:menus.vim = {
        \ 'description': 'Edit vimrc'
        \ }
    let s:menus.vim.file_candidates = [
        \ ['vimrc', '~/.vimrc'],
        \ ]
    call denite#custom#var('menu', 'menus', s:menus)
endif
" }

" vim-vue
"let g:vue_disable_pre_processors=1
