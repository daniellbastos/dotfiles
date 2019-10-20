" -----------------------------------------------------------------------------
" Who: Daniel Bastos (@daniellbastos)
" Description: The vim configuration
" -----------------------------------------------------------------------------

" -----------------------------------------------------------------------------
" Vundle core
" -----------------------------------------------------------------------------

set nocompatible        " be iMproved!
filetype off


set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" -----------------------------------------------------------------------------
" My Plugins
" -----------------------------------------------------------------------------
    " let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'

    "" Basic plugins
    Plugin 'bronson/vim-trailing-whitespace'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'tpope/vim-fugitive'
    Plugin 'terryma/vim-multiple-cursors'
    Plugin 'mattn/emmet-vim'
    Plugin 'ctrlpvim/ctrlp.vim'
    Plugin 'SirVer/ultisnips'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'

    "" Color
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'sickill/vim-monokai'
    Plugin 'dracula/vim'
    Plugin 'godlygeek/csapprox'
    Plugin 'sonph/onehalf', {'rtp': 'vim/'}

    "" Python Stack
    Plugin 'davidhalter/jedi-vim'
    Plugin 'scrooloose/syntastic'
    Plugin 'Yggdroot/indentLine'

    "" HTML/CSS Stack
    Plugin 'gregsexton/MatchTag'
    Plugin 'miripiruni/CSScomb-for-Vim.git'
call vundle#end()


filetype plugin indent on    " enable syntax highlighting, required

" -----------------------------------------------------------------------------
"  Regular vim configuration (no plugins need)
" -----------------------------------------------------------------------------

syntax enable                  " turn on syntax highlighting allowing local
set number                     " show line numbers
set ruler                      " show line and column number overrides
set encoding=utf-8             " set default encoding to UTF-8
set listchars=""               " reset the listchars
set listchars=tab:\ \          " a tab should display as " ", trailing whitespace as "."
set listchars+=trail:.         " show trailing spaces as dots
set listchars+=extends:>       " the character to show in the last column when wrap is off and the line continues beyond the right of the screen
set listchars+=precedes:<      " the character to show in the last column when wrap is off and the line continues beyond the left of the screen
set clipboard=unnamedplus      " better Copy & Paste
set nobackup                   " disable backup before overwriting a file
set nowritebackup              " disable backup before overwriting a file
set noswapfile                 " disable swap file
set cul                        " highlight the screen line of the cursor
set linespace=4                " add some line space for easy reading
set colorcolumn=110            " Useful to align text
set expandtab                  " use spaces, not tabs
set list                       " show invisible characters
set tabstop=4                  " a tab is two spaces
set softtabstop=4
set shiftwidth=4
set shiftround
set copyindent
set backspace=indent,eol,start " backspace through everything in insert mode

""" Searching
set hlsearch                   " highlight matches
set incsearch                  " incremental searching
set ignorecase                 " searches are case insensitive...
set smartcase                  " unless they contain at least one capital letter

set guioptions-=m              " remove menu
set guioptions-=T              " remove toolbar
set laststatus=2
set nofoldenable
set t_Co=256
set title
set titleold="Terminal"
set titlestring=%F
set cursorline

set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,.pyc,__pycache__,*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite3,*/node_modules/*

" auto-load .vimrc file
autocmd! bufwritepost .vimrc source %


"load ftplugins and indent files
filetype plugin on
filetype indent on

" -----------------------------------------------------------------------------
" Colorscheme settings
" -----------------------------------------------------------------------------

" colorscheme cake16
colorscheme dracula
" colorscheme onehalfdark
" let g:airline_theme='onehalfdark'
let g:airline_theme='dracula'
let g:airline#extensions#tabline#formatter = 'default'

" -----------------------------------------------------------------------------
" Abbreviations
:" -----------------------------------------------------------------------------

"" no one is really happy until you have this shortcuts
cab W! w!
cab Q! q!
cab Wq wq
cab Wa wa
cab wQ wq
cab WQ wq
cab W w
cab Q q

" -----------------------------------------------------------------------------
" Mappings
" -----------------------------------------------------------------------------

"" rebind <leader> key
let mapleader=","

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Easier moving between buffers
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Close buffer
noremap <leader>c :bd<CR>

"" Switch windows with two keystrokes
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h

" -----------------------------------------------------------------------------
" Plugins settings
" -----------------------------------------------------------------------------

"" Basic
let g:airline#extensions#tabline#enabled = 1

"" Syntastic
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_aggregate_errors = 1

"" Syntastic python
let g:syntastic_python_checkers=['pep8', 'pyflakes']

" Jedi-python
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"

"" Multiple Cursor
let g:multi_cursor_next_key='<C-d>'

"" Custom git
let g:gitgutter_max_signs = 1000

"" ctrlp.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|tox|ico|git|hg|svn))$'
let g:ctrlp_user_command = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
let g:ctrlp_use_caching = 1
cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
noremap <leader>b :CtrlPBuffer<CR>
let g:ctrlp_map = '<leader>e'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor --ignore '+ g:ctrlp_custom_ignore +' -g ""'
endif

set nospell
let s:spellchecker = 0
"" Spell Checker
function ToggleSpellChecker()
    if s:spellchecker
        set nospell
        let s:spellchecker = 0
    else
        set spell spelllang=pt
        let s:spellchecker = 1
    endif
endf

map <F5> :call ToggleSpellChecker()<CR>

"" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Custom tabstop for frontend files
autocmd FileType ruby,javascript,css,html,jade,coffee,htmldjango
       \ set expandtab | set softtabstop=2 | set shiftwidth=2
" autocmd FileType html setlocal ts=2 sts=2 sw=2
" autocmd FileType javascript setlocal ts=4 sts=4 sw=4
" autocmd BufRead,BufNewFile *.htm,*.html, *.js, *.css, *.scss, *.vue setlocal tabstop=2 shiftwidth=2 softtabstop=2
