"------ generic options ------
set nocompatible
set history=10000

"------ commands rules ------
set wildmenu                " Extended autocompletion for commands
set wildcharm=<TAB>         " Autocompletion hotkey
let mapleader=","          " <Leader> key
set pastetoggle=<Leader>p   " toggle paste mode on \p
" Disable ex mode keybinding
nnoremap Q <nop>

"------ pathogen plugins ------
filetype off " Turn off filetype plugins before bundle init
execute pathogen#infect()

"------ filetype rules ------
filetype plugin indent on
if has("autocmd")
  au BufRead,BufNewFile *.md set filetype=markdown
endif

"------ vim help ------
cnoremap help vert bo help
"cnoremap help call ShowVertHelp()
function! ShowVertHelp()
"        let cmdtype = getcmdtype()
"        if cmdtype == ':'
                execute ":vert bo help"
                execute ":vert res 80"
"        endif
endfunction

"------ search rules ------
set incsearch         " Incremental searching on
set hlsearch          " Highlight all matches
"set ignorecase        " Ignore case in search patterns
"set smartcase         " Override the 'ignorecase' option if upper case chars present in search pattern
set showmatch         " Show matching brackets
set matchpairs+=<:>   " Make < and > match as well
" Disable higlighting search result on Enter key:
nnoremap <silent> <cr> :nohlsearch<cr><cr> 

"------ navigation rules ------
set scrolloff=10      " Scroll the window so we can always see 10 lines around the cursor
set sidescrolloff=10  " Numbers of columns to keep to the left and to the right off the screen
set nostartofline     " The cursor should stay where you leave it, instead of moving to the
                      " first nonblank of the line
set whichwrap=b,s,<,>,[,],    " Vim will move to the previous/next line after reaching first/last char in
                              " the line with this commnad (you can add 'h' or 'l' here as well)
                              " <,> stand for arrows in command mode and [,] arrows in visual mode

"------ editing rules ------
if has("autocmd")
  autocmd VimEnter * set vb t_vb= " No beep
endif
set novisualbell          " Mute error bell
set encoding=utf-8        " Set character encoding to use in vim
set termencoding=utf-8    " Let vim know what encoding we use in our terminal
if &modifiable
    set fileformat=unix   " Which EOl used. For us it's unix(not works with modifiable=no)
endif
set iskeyword+=-          " Add '-' as recognized word symbol. e.g dw delete all 'foo-bar' instead just 'foo'
set backspace=indent,eol,start  " Allow backspace to remove indents, newlines and old text

"------ indentation rules ------
set expandtab       " Replace tabs with spaces
set autoindent      " Keep indentation from previous line
set smartindent     " Automatically inserts indentation in some cases
set cindent         " Like smartindent, but stricter and more customisable
set tabstop=2       " Size of a hard tabstop
set shiftwidth=2    " Size of an 'indent'
set softtabstop=2   " A combination of spaces and tabs are used to simulate tab stops
                    " at a width other than the (hard)tabstop
set shiftround      " Round indent to multiple of 'shiftwidth'.

"------ text view rules ------
set ttyfast     "Indicates fast terminal connection
set list        " Enable display whitespace characters
set list listchars=nbsp:·,tab:→\ ,trail:·,extends:>,precedes:< " Mark tabs and trailing spaces
set nowrap      " Disable wrapping long string

"------ color schemes ------
syntax on       " syntax highlighting
set t_Co=256    " 256 colors
set bg=dark     " dark background
let g:zenburn_high_Contrast = 1
let g:liquidcarbon_high_contrast = 1
let g:molokai_original = 1
colorscheme molokai

"------ auxilary view options ------
set noshowmode      " Hide showmode(useless with airline)
set shortmess=atI   " Remove all useless messages like intro screen and use abbreviation like RO
                    " instead readonly and + instead modified
set number          " Display Line numbers
set cursorline      " Highlight line with cursor
set noruler         " No ruler
set showcmd         " Display command which you typing and other command related stuff
set laststatus=2    " Indicate that last window have a statusline too

"------ diff view options ------
set diffopt=filler,vertical,iwhite  " Display filler, vertical diff, ignore changes in whitespaces

"-------------------------
" DelimitMate
"-------------------------

" Delimitmate place cursor correctly n multiline objects e.g.
" if you press enter in {} cursor still be
" in the middle line instead of the last
let delimitMate_expand_cr = 1

" Delimitmate place cursor correctly in singleline pairs e.g.
" if x - cursor if you press space in {x} result will be { x } instead of { x}
let delimitMate_expand_space = 1

" Without this we can't disable delimitMate for specific file types
let loaded_delimitMate = 1

"-------------------------
" autofenc
"-------------------------
let g:autofenc_ext_prog_args="-i -L ru"

"-------------------------
" minibufexplorer
"-------------------------
let g:miniBufExplMaxSize = 3

"-------------------------
" textile
"-------------------------
let g:TextileOS="Linux"
let g:TextileBrowser="/usr/bin/firefox"

"-------------------------
" autoclose
"-------------------------
let g:autoclose_vim_commentmode = 1

"-------------------------
" YouCompleteMe
"-------------------------
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_use_ultisnips_completer = 1
let g:ycm_autoclose_preview_window_after_completion = 1  " Automatically close window after input
let g:ycm_show_diagnostics_ui = 1 " use ycm checks instead of syntastic's
let g:ycm_seed_identifiers_with_syntax = 1

"-------------------------
" UltiSnips
"-------------------------
let g:UltiSnipsSnippetDirectories = ["bundle/vim-snippets/UltiSnips"]
let g:UltiSnipsExpandTrigger = "<c-e>"

"-------------------------
" AutoComplPop
"-------------------------
let g:acp_enableAtStartup = 0

"-------------------------
" neocomplete
"-------------------------
let g:neocomplete#enable_at_startup = 0

" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

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
"inoremap <expr><C-g>     neocomplete#undo_completion()
"inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
"endfunction
" <TAB>: completion.
"inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

"-------------------------
" neosnippet
"-------------------------
" Enable snipMate compatibility
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" Disables standart snippets. We use vim-snippets bundle instead
"let g:neosnippet#disable_runtime_snippets = { '_' : 1 }

" Expand snippet and jimp to next snippet field on Enter key.
"imap <expr><CR> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<CR>"

"-------------------------
" syntastic
"-------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }
" let g:syntastic_aggregate_errors = 1

" syntastic fortran
let g:syntastic_fortran_compiler_options = " -std=f2008ts -DNDEBUG -fimplicit-none -fopenmp -Wall -pedantic "

" syntastic c/cpp
let g:syntastic_cpp_compiler_options = " -std=gnu++11 -DNDEBUG -fopenmp -Wall -pedantic "
let g:syntastic_cpp_include_dirs = [ '/usr/include/x86_64-linux-gnu' ]
let g:syntastic_cpp_check_header = 1
" use json compilation database with clang-tidy
let g:syntastic_cpp_clang_tidy_post_args = ""

" syntastic python
"let g:syntastic_python_python_use_codec = 1

"-------------------------
" airline
"-------------------------
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline#extensions#whitespace#enabled = 0

"-------------------------
" tagbar
"-------------------------
let g:tagbar_left = 1
nnoremap <silent> <leader>t :TagbarToggle<cr>

"-------------------------
" rainbow parentheses
"-------------------------
let g:rainbow_active = 0
let g:rainbow_conf = {
\   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\     '*': {},
\     'cpp': {
\      'parentheses': [
\         'start=/(/ end=/)/ fold',
\         'start=/\[/ end=/\]/ fold',
\         'start=/{/ end=/}/ fold',
\         'start=/\(\(\<operator\>\)\@<!<\)\&[a-zA-Z0-9_]\@<=<\ze[^<]/ end=/>/']
\     },
\     'tex': {
\         'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\     },
\     'lisp': {
\         'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\     },
\     'vim': {
\         'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\     },
\     'html': {
\         'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\     },
\     'css': 0,
\     'cmake':0
\   }
\}
nnoremap <silent> <leader>r :RainbowToggle<cr>
if has("autocmd")
  au FileType c,cpp,objc,objcpp RainbowToggle
  au FileType lisp RainbowToggle
endif

