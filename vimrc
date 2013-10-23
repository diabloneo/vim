" Common settings
set nocompatible
set shiftwidth=4
set tabstop=4
set expandtab
set hidden
"" -- set autochdir  # this is conflict with cscope
set wildchar=<Tab> wildmenu wildmode=full
filetype off

"" Statusline settings
set laststatus=2
set statusline=%f "tail of the filename

"" Search settings
set hlsearch
set incsearch

"" Encoding settings
set encoding=utf-8
set fileencodings=utf-8,gbk

" Vundle settings
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

""" My bundles here (original repos on github
Bundle 'klen/python-mode'
"""" Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'plasticboy/vim-markdown'

filetype plugin indent on 
filetype plugin on

"" Color theme settings
syntax enable 

"
" Text file settings

"" Markdown language
let g:vim_markdown_folding_disabled=1

" Programming settings

"" Tagging system settings
set cscopetag
set csprg=gtags-cscope
set cscopequickfix=s-,c-,d-,i-,t-,e-,f-,g-

let GtagsCscope_Auto_Load=1
let GtagsCscope_Auto_Map=1
let GtagsCscope_Ignore_Case=1
let GtagsCscope_Quiet=1

"" C programming language
:augroup cprograms
:   autocmd FileReadPost *.c :set cindent
:   autocmd FileReadPost *.h :set cindent
:   autocmd FileReadPost *.hbh :set cindent 
:   autocmd FileReadPost *.hbc :set cindent
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
let g:pymode_lint_checker=" pyflakes,pep8"
let g:pymode_lint_write=1

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

" Keyboard mappings
:nnoremap <C-k>0 :vsplit<CR><C-w><C-w>:split<CR><C-w><C-w><C-w>
