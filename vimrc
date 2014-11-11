""""""""""""""""""""""""""""""""""""""""
"
" Sections:
"   -> Common settings
"   -> Vundle settings
"   -> Color theme settings
"   -> Directory settings
"   -> Text file settings
"   -> Programming settings
"   -> Keyboard mappings

" Common settings
set nocompatible " The most important setting

set history=200
set wildchar=<Tab> wildmenu wildmode=longest,list

filetype off
filetype plugin indent off

"" Move settings
map j gj
map k gk

"" Buffer settings
set hidden
set switchbuf=useopen,usetab

"" Tab settings
set showtabline=2

"" Statusline settings
""" Replaced by vim-airline
""" set statusline=%m%r\"%f\"\ \ %P\ (%l,%c)\ %y

"" Search settings
set ignorecase
set smartcase
set hlsearch
set incsearch

"" Encoding settings
set encoding=utf-8
set fileencodings=utf-8,gbk

"" Backups settings
set noswapfile " turn swap file off 

" Vundle settings
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'

"" My bundles here (original repos on github)
Plugin 'klen/python-mode'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'plasticboy/vim-markdown'
Plugin 'junegunn/vim-easy-align'
Plugin 'diabloneo/cscope_maps.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'jnwhiteh/vim-golang'
Plugin 'dgryski/vim-godef'
"# Plugin 'blackrush/vim-gocode'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'mileszs/ack.vim'
Plugin 'davidhalter/jedi-vim'

filetype plugin indent on 
filetype plugin on

" Color theme settings
syntax enable 
set t_Co=256

"" vim-airline settings
let g:airline_theme="murmur"
set laststatus=2

" Diectory settings

"" Netrw settings
let g:netrw_list_hide='.*\.o$,.*\.d$'

"" CtrlP settings
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'

let g:ctrlp_working_path_mode='a'

"" nerdtree settings
map <C-n> :NERDTreeToggle<CR>

" Text file settings

"" Tab and indent settings
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

"set autoindent
"set smartindent

"" Markdown language
let g:vim_markdown_folding_disabled=1

"" EasyAlign mappings
:vmap <Enter> <Plug>(EasyAlign)
:nmap <Leader>a <Plug>(EasyAlign)

" Programming settings

"" Common programming settings
set colorcolumn=81
highlight ColorColumn ctermbg=4

"" Auto completion settings
set completeopt=menu

"" Diff and patch settings
set diffopt=filler,vertical,context:3

"" Tagging system settings

""" Cscope settings
set cscopetag
"# use quickfix window to display tagging result
set cscopequickfix=s-,c-,d-,i-,t-,e-,f-,g-

""" Tagbar settings
:nmap <F8> :TagbarToggle<CR>

"# extend tagbar for golang
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

"" make commands settings
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

"" C programming language
:augroup cprograms
:   autocmd!
:   autocmd FileReadPost *.c,*.h,*.hbh,*.hbc set cindent | \
                                             set cinoptions=(0:0l1
:augroup END

"" Python programming language
""" python-mode settings
let g:pymode_rope=1

"""" Documentation
let g:pymode_doc=1
let g:pymode_doc_key='K'

"""" Run code
let g:pymode_run=1
let g:pymode_run_key='<leader>r'

"""" Linting
let g:pymode_lint=1
let g:pymode_lint_checker="pyflakes,pep8"
let g:pymode_lint_write=1
let g:pymode_lint_ignore = "E501"

"""" Support virtualenv
let g:pymode_virtualenv=1

"""" Enable breakpoints plugin
let g:pymode_breakpoint=1
let g:pymode_breakpoint_key='<leader>b'

"""" Syntax highlighting
let g:pymode_syntax=1
let g:pymode_syntax_all=1
let g:pymode_syntax_indent_errors=g:pymode_syntax_all
let g:pymode_syntax_space_errors=g:pymode_syntax_all

"""" Don's autofold code
let g:pymode_folding=0

"" Go programming language
:autocmd FileType go autocmd BufWritePre <buffer> Fmt

let g:godef_same_file_in_same_window=1

"" Java programming language
:augroup javaprograms
:   autocmd!
:   autocmd FileType java set shiftwidth=2 tabstop=2
:augroup END

" Keyboard mappings
:nmap <Space> :nohl<CR>
:nnoremap <C-k>0 :vsplit<CR><C-w><C-w>:split<CR><C-w><C-w><C-w>
:nnoremap <F2> :botright copen<CR>
:nnoremap <F4> :cclose<CR>
:cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
