""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Author: Litao SHEN
" => Description: This is my own vimrc file which is used to help
"                 myself coding faster than plain vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"no vi-compatible
set nocompatible

" setting comments for different filetypes
autocmd FileType *  set formatoptions=tcq
            \ nocindent comments&

" Make Neomake work
autocmd! BufWritePost,BufEnter * Neomake
autocmd InsertLeave,TextChanged * update | Neomake

autocmd BufReadPost,BufNewFile *.js set filetype=javascript
autocmd BufReadPost,BufNewFile *.ts set filetype=typescript
autocmd BufReadPost,BufNewFile *.json set filetype=json
autocmd BufReadPost,BufNewFile *.txt,*.md,*.mdown,*.mkd,*.mkdn set filetype=markdown

autocmd BufReadPost,BufNewFile *.js, *.php set formatoptions=tcroq
            \ cindent comments=sr://,mb://,ex://,://

autocmd BufNewFile,BufReadPost *.html, *.blade.php set formatoptions=tcroq
            \ cindent comments=sr:<!--,mb:--,ex:-->

autocmd BufNewFile,BufReadPost *.txt,*.md,*.mdown,*.mkd,*.mkdn set spell

autocmd BufReadPost,BufNewFile *.ts,*.json,*.js,*.css,*.pug set tabstop=2 shiftwidth=2 expandtab

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CtrlP configulation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" CtrlP will set its local working directory according to this variable
" 'c' - the directory of the current file.
" 'r' - the nearest ancestor that contains one of these directories or files:
" .git .hg .svn .bzr _darcs
" 'a' - like c, but only if the current working directory outside of CtrlP is
" not a direct ancestor of the directory of the current file.
" 0 or '' (empty string) - disable this feature.
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/.git/*,*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip,*.pyc
" let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux

"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
            \ 'dir': '\v[\/]\.(dist|git|hg|svn|node_modules)$',
            \ 'file': '\v\.(exe|so|dll)$',
            \ 'link': 'some_bad_symbolic_links',
            \ }
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let &viewdir=expand("$HOME") . "/.bk/.vim/viewdir"
if !isdirectory(expand(&viewdir))|call mkdir(expand(&viewdir), "p", 451)|endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=1000

" Set to auto read when a file is changed from the outside
set autoread
" auto save file
set autowrite

" set for save functions
command! W w !sudo tee % > /dev/null

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Setting up Vim-Plug - the vim plugin bundler
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/bundle')

"required for vundle
" filetype off

"++++++++++++++++++++++++ Bundles from GitHub repos: +++++++++++++++++++++++"

" increment number automatically
Plug 'exvim/ex-visincr'

" alignment
Plug 'godlygeek/tabular'

" UltiSnips Snippets
" Track the engine.
Plug 'SirVer/ultisnips' 

Plug 'honza/vim-snippets'

" pathogen.vim
" Plug 'tpope/vim-pathogen'

" Better file browser
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Powerline
Plug 'Lokaltog/vim-powerline'

" Class/module browser
Plug 'majutsushi/tagbar'

" Tab list panel
Plug 'kien/tabman.vim'

" Pending tasks list
Plug 'fisadev/FixedTaskList.vim'

" haskell.vim
"Plug 'haskell.vim'

" Color schemes
Plug 'flazz/vim-colorschemes'

" Surround
Plug 'tpope/vim-surround'

" Auto complete quotes etc. auto-pairs
Plug 'jiangmiao/auto-pairs'

" Autoformat all buffers by this plugin
Plug 'Chiel92/vim-autoformat'

" YouCompleteMe
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --js-completer' }

" Nerd commenter
Plug 'scrooloose/nerdcommenter'

" vim multiple cursors (like feature in sublime)
Plug 'terryma/vim-multiple-cursors'

" for html + css
"Plug 'mattn/emmet-vim'

" Use neomake instead of syntastic with aync feature
Plug 'neomake/neomake'

" kien/ctrlp.VIM
Plug 'ctrlpvim/ctrlp.vim'

"Debugger"
" Plug 'joonty/vdebug'

" vim-gitgutter
Plug 'airblade/vim-gitgutter'


" ag.vim a replacement for ack "
"Plug 'rking/ag.vim'
Plug 'mileszs/ack.vim'

" Easy motion
Plug 'easymotion/vim-easymotion'

" markdown file
Plug 'tpope/vim-markdown', {'for': 'markdown'}
" Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

" Pug
Plug 'dNitro/vim-pug-complete', { 'for': ['jade', 'pug'] }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins for javascript
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" node vim
Plug 'moll/vim-node', {'for': 'javascript'}
" othree/javascript-libraries-syntax.vim "
Plug 'othree/javascript-libraries-syntax.vim', {'for': 'javascript'}
" tern_for_vim "
Plug 'marijnh/tern_for_vim', {'for': 'javascript'}
" For Javascript ES7
Plug 'othree/yajs.vim', {'for': 'javascript'}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins for jsx
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" jsx
Plug 'mxw/vim-jsx'
" React Snippets
Plug 'letientai299/vim-react-snippets', { 'branch': 'es6' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins for typescript
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Typescript Syntax for Vim
Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
" YATS: Yet Another TypeScirpt Syntax
Plug 'HerringtonDarkholme/yats.vim', {'for': 'typescript'}

" Initialize plugin system
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable filetype plugins
filetype plugin on
filetype indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" setup for pathogen
" execute pathogen#infect()
" execute pathogen#helptags()

" automatically close autocompletion window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" automatically format buffer
noremap <leader>f :Autoformat<CR><CR>

" set up NERDTree
" NERDTree (better file browser) toggle
map <leader>nn :NERDTreeToggle<CR>

" map for todo list "
map <leader>td <Plug>TaskList

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Linebreak on 500 characters
"set lbr
"set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ack.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ctags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set tags location
" set tags=./tags;/
" map tag bar to ,b
nnoremap <silent> <Leader>b :TagbarToggle<CR>
" combine ctags with CtrlP
nnoremap <leader>. :CtrlPTag<cr>

" map for ctags update
map <leader>tu :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM text folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set fold method to be syntax
"set fdm=syntax
set fdm=indent
set nofoldenable

" set for markdown file
let g:vim_markdown_folding_disabled=1

" save the folding status automatically
au BufWinLeave .* mkview
au BufNewfile,BufWinEnter .* silent loadview

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set 10 lines to the cursor - when moving vertically using j/k
set so=10

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore+=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

"highlight search results
set hlsearch

"incremental search
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" How many tenths of a second to blink when matching brackets
set mat=2

set textwidth=80
" show color line for textwidth over 80
if exists('+colorcolumn')
    set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

"showing mathced cursor
set showmatch

"showing line number
"set nu
"
"function! NumberToggle()
  "if(&relativenumber == 1)
    "set number
  "else
    "set relativenumber
  "endif
"endfunc

"nnoremap <C-n> :call NumberToggle()<cr>

autocmd FocusLost * :set number
autocmd FocusGained * :set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" No annoying sound on errors
set noerrorbells
set novisualbell
"set t_vb=
set tm=500

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
"map <C-t> <C-W>t
"map <C-b> <C-W>b

" resize window size
map <C-+> <C-W>+
map <C--> <C-W>-

" Close the current buffer
map <leader>bd :Bclose<CR>

" Close all the buffers
map <leader>ba :1,1000 bd!<CR>

" tab navigation
" Useful mappings for managing tabs
map <leader>tt :tabnew<CR>
map <leader>to :tabonly<CR>
map <leader>tc :tabclose<CR>
map <leader>tm :tabmove
map <leader>tn :tabn<CR>
map <leader>tb :tabp<CR>
"map <C-S-Right> :tabn<CR>
"map <C-S-Left> :tabp<CR>


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<CR>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<CR>:pwd<CR>

" Specify the behavior when switching between buffers
try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif
" Remember info about open buffers on close
set viminfo^=%

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => neomake settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When writing a buffer, and on normal mode changes (after 750ms).
call neomake#configure#automake('nrw')

" Open neomake error window
" let g:neomake_open_list = 2

" Set neomake warning/error sign
let g:neomake_warning_sign = {
  \ 'text': 'W',
  \ 'texthl': 'WarningMsg',
  \ }
let g:neomake_error_sign = {
  \ 'text': 'E',
  \ 'texthl': 'ErrorMsg',
  \ }

" Enable neomake for javascript
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_typescript_enabled_makers = ['tsc']
let g:neomake_json_enabled_makers = ['jsonlint']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerdcommenter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
"let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
"let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => utilsnips settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YCM settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => javascript settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:formatprg_js="js-beautify"

let g:used_javascript_libs='jquery,angularjs,angularui,underscore,chai,requirejs,react,d3'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tern settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tern_show_argument_hints='on_hold'
" and 
let g:tern_map_keys=1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => html & css settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:formatprg_html = "js-beautify --html"
let g:formatprg_css = "js-beautify --css"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => python settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"augroup vimrc_autocmds
"autocmd!
"" highlight characters past column 120
"autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
"autocmd FileType python match Excess /\%120v.*/
"autocmd FileType python set nowrap
"augroup END

autocmd FileType python set omnifunc=pythoncomplete#Complete

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Haskell settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use ghc functionality for haskell files
" au Bufenter *.hs compiler ghc

"Configure browser for haskell_doc.vim
" let g:haddock_browser = "open"
" let g:haddock_browser_callformat = "%s -a Google\ Chrome  %s"

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""""
" Powerline setup
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9

"" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\\\ Line:\ %l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
syntax on

"set syntax=markdown

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" use 256 colors when possible
"if &term =~? 'mlterm\|xterm\|xterm-256\|screen-256'
let t_Co = 256
let g:solarized_termcolors=256
let g:solarized_visibility="high"
let g:solarized_contrast="high"
let g:solarized_termtrans=1
" color
colorscheme solarized
"else
"let g:solarized_termcolors=256
" color
"colorscheme solarized
"endif

" Set utf8 as standard encoding and en_US as the
" standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"enable call mouse
if( has('mouse') )
    set mouse=a
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RemoveFancyCharacters COMMAND
" Remove smart quotes, etc.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RemoveFancyCharacters()
    let typo = {}
    let typo["“"] = '"'
    let typo["”"] = '"'
    let typo["‘"] = "'"
    let typo["’"] = "'"
    let typo["–"] = '--'
    let typo["—"] = '---'
    let typo["…"] = '...'
    :exe ":%s/".join(keys(typo),
    '\|').'/\=typo[submatch(0)]/ge'
endfunction
command! RemoveFancyCharacters :call RemoveFancyCharacters()
