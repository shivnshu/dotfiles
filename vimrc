"PluginManagerUsed 'vim-plug' from https://github.com/junegunn/vim-plug

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""PlugIns"""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'                                      " Used for writing comments(usage: \cc) 
Plug 'scrooloose/nerdtree' , {'on': 'NERDTreeToggle'}                " Proper file explorer inside vim
Plug 'flazz/vim-colorschemes'                                        " Colorschemes
Plug 'tpope/vim-surround'                                            " Quick Surround with tags or Brackets
Plug 'octol/vim-cpp-enhanced-highlight'                              " C++ syntax highlighter
Plug 'Lokaltog/vim-easymotion'                                       " Easy Motion 
Plug 'myusuf3/numbers.vim'                                           " Toggle between relative and normal numbering
Plug 'sjl/gundo.vim'                                                 " Undo tree
Plug 'marcweber/vim-addon-mw-utils'                                  " Todo: figureout its usage 
Plug 'garbas/vim-snipmate'                                           " Snippets for reusable code
Plug 'tpope/vim-fugitive'                                            " Git Wrapper
Plug 'tomtom/tlib_vim'                                               " Required by other plugins
Plug 'auto-pairs-gentle'                                             " Auto insert matching brackets
Plug 'autoswap.vim'                                                  " Deals with swap messages errors 
Plug 'godlygeek/tabular'                                             " Helps in alignment
Plug 'plasticboy/vim-markdown'                                       " Markdown support for vim
Plug 'jceb/vim-orgmode'                                              " Helps in scheduling of task, tags, todo 
Plug 'cmdalias.vim'                                                  " Alias for commands(eg. cd for Cd)
Plug 'Python-Syntax-Folding'                                         " Syntax folding for python
Plug 'nvie/vim-flake8'                                               " Syntax and style checker for python code
Plug 'bling/vim-airline'                                             " Status and tabline for vim
Plug 'kien/ctrlp.vim'                                                " Fuzzy file searching
Plug 'terryma/vim-multiple-cursors'                                  " Multiple Cursors like Sublime Text(usage: ctr-n)
Plug 'kchmck/vim-coffee-script'                                      " Highlighting and syntax for coffeescript(language that compiles to JavaScript)
Plug 'fatih/vim-go'                                                  " AutoCompletion syntax-highlighting
Plug 'KabbAmine/zeavim.vim'                                          " Access zeal documentation from vim
Plug 'Superbil/llvm.vim', { 'for': 'llvm' }                          " LLVM assembly files highlighting
Plug 'rhysd/vim-clang-format'                                        " Formats the code with specific coding style using clang
Plug '~/new_proj/vim/autorun'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" >> Syntax checking and auto-complete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 1
let g:syntastic_aggregate_errors = 1        " Aggregate errors from all checkers

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" autocmd FileType json set foldmethod=syntax

autocmd QuickFixCmdPost [^l]* nested cwindow

" Typescript
let g:syntastic_typescript_checks=['tsc', 'tslint']
" Make the compiler search for the tsconfig.json file starting in
" the current directory and continuing up the parent directory chain.
let g:syntastic_typescript_tsc_fname = ''
" let g:syntastic_typescript_checkers = []

" autocmd FileType typescript :set makeprg=tsc
" let g:typescript_compiler_binary = 'tsc'
" let g:typescript_compiler_options = ''

" Javascript
let g:javascript_plugin_jsdoc = 1

" C/C++
" let g:clang_library_path='/usr/lib/llvm-3.4/lib'
" let g:syntastic_cpp_compiler = 'clang++'
" let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'

" Assembly
" let g:syntastic_asm_compiler = 'mipsel-linux-gcc'
let g:syntastic_asm_checkers = []


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme jellybeans                                               " Set colorscheme
set tabstop=2
set shiftwidth=2                                                     " Indentation
syntax on
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""Configs"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let NERDTreeIgnore=['\.pyc$', '__pycache__']                         " Ignoring .pyc files and __pycache__ folder
let g:go_fmt_command = "goimports"                                   " Rewrite go file with correct imports
set wildignore+=*/bin/*,main,*/__pycache__/*,*.pyc,*.swp
set backspace=indent,eol,start                                       " Make backspace work with end of line and indents
set foldmethod=syntax                                                " Auto Add folds - Trigger with za
set foldlevel=9999                                                   " Keep folds open by default
set scrolloff=12                                                     " Scroll Offset below and above the cursor
set expandtab                                                        " Replace tab with spaces
set softtabstop=2                                                    " Act like there are tabs not spaces
set hidden                                                           " Hide abandoned buffers without message
set wildmenu                                                         " Tab command completion in vim
set ignorecase                                                       " Ignore case while searching
set smartcase                                                        " Case sensitive if Capital included in search
set incsearch                                                        " Incremental Searching - Search as you type
set autoindent                                                       
set smartindent
set relativenumber                                                   " Relative numbering (Current line in line 0)
set number                                                           " Line numbers - Hybrid mode when used with rnu
set nowrap                                                           " NoWrap 
set laststatus=2                                                     " Show status line for even 1 file
set tags=~/.mytags                                                   " Path to generated tags
set mouse=nv                                                         " Allow mouse usage in normal and visual modes
set nohlsearch                                                       " Do not highlight all search suggestions.
let g:airline_powerline_fonts = 1                                    " Powerline fonts
let g:airline#extensions#tabline#enabled = 1                         " Show buffers above

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "IndentWidth" : 4,
            \ "TabWidth" : 4,
            \ "AllowShortIfStatementsOnASingleLine" : "false",
            \ "AllowShortBlocksOnASingleLine" : "false",
            \ "AllowShortLoopsOnASingleLine" : "false",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11" }

set clipboard=unnamedplus

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""KeyBindings""""""""""""""""""""""""""""""""""""""""""""""""""""""

"NerdTree Toggle with F2
inoremap <F2> <Esc>:NERDTreeToggle<CR>a                             
nnoremap <F2> :NERDTreeToggle<CR>

"Switch between absolte and relative numbers using plugin: numbers.vim
nnoremap <F3> :NumbersToggle<CR>                                   
nnoremap <F4> :NumbersOnOff<CR>

"Undo graphical tree toggle
nnoremap <F5> :GundoToggle<CR>

"Show open buffers and helps in switching
nnoremap <F6> :buffers<CR>:buffer<Space>

"vim-easy motion shortcut
nmap ,, <leader><leader>s

"Switch buffers with Tab and Shift-Tab
nnoremap  <silent>   <tab>  mq:bnext<CR>`q`
nnoremap  <silent> <s-tab>  mq:bprevious<CR>`q`

"Syntastic Key bindings"
nmap <C-l> :SyntasticToggleMode<CR>

" w!! force write with sudo even if forgot sudo vim
cmap w!! w !sudo tee > /dev/null %


vnoremap ,y "+yy
nnoremap ,y "+yy
vnoremap ,d "+dd
nnoremap ,d "+dd
vnoremap ,p "+p
nnoremap ,p "+p
vnoremap ,P "+P
nnoremap ,P "+P


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
