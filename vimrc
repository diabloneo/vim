""""""""""""""""""""""""""""""""""""""""
"
" Sections:
"   -> Common settings
"   -> Vundle settings
"   -> Color theme settings
"   -> Directory settings
"   -> Common file settings
"   -> Programming settings
"   -> Define functions
"   -> Keyboard mappings

" Common settings
set nocompatible " The most important setting

set history=200
set wildchar=<Tab> wildmenu wildmode=longest,list

filetype off
filetype plugin indent off

" if has("python3")
"     command! -nargs=1 Py py3 <args>
" endif

"" Move settings
map j gj
map k gk

"" Buffer settings
set hidden
set switchbuf=useopen

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
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

"" My bundles here (original repos on github)
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'plasticboy/vim-markdown'
Plugin 'junegunn/vim-easy-align'
Plugin 'diabloneo/cscope_maps.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'fatih/vim-go', {'name': 'fatih-vim-go'}
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mileszs/ack.vim'
Plugin 'mattn/emmet-vim'
Plugin 'kien/tabman.vim', {'name': 'tabman'}
Plugin 'altercation/vim-colors-solarized', {'name': 'solarized-theme'}
Plugin 'benmills/vimux'
Plugin 'marcweber/vim-addon-mw-utils', {'name': 'vim-addon-mw-utils'} " used by vim-snipmate
Plugin 'tomtom/tlib_vim', {'name': 'tlib_vim'} " used by vim-snipmate
Plugin 'garbas/vim-snipmate', {'name': 'vim-snipmate'}
Plugin 'honza/vim-snippets', {'name': 'vim-snippets'}
Plugin 'tpope/vim-fugitive', {'name': 'fugitive'}
Plugin 'nvie/vim-flake8', {'name': 'vim-flake8'}
Plugin 'davidhalter/jedi-vim'
Plugin 'hynek/vim-python-pep8-indent', {'name': 'vim-python-pep8-indent'}
Plugin 'Valloric/YouCompleteMe', {'name': 'youcompleteme'}
Plugin 'chase/vim-ansible-yaml', {'name': 'ansible-yaml'}

call vundle#end()

filetype plugin indent on 
filetype plugin on

" Color theme settings
syntax enable 
set t_Co=256
set background=light
colorscheme solarized
set ruler
set number
set cursorline
set cursorcolumn

"" vim-airline settings
let g:airline_theme='solarized'
set laststatus=2

" Diectory settings

"" BufExplorer settings
let g:bufExplorerShowRelativePath=1

"" Netrw settings
let g:netrw_list_hide='.*\.o$,.*\.d$'

"" CtrlP settings
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'

let g:ctrlp_show_hidden=1
let g:ctrlp_working_path_mode='a'
let g:ctrlp_custom_ignore={
    \ 'file': '\v\.(pyc|pyo)$',
    \ 'dir': '\v[\/]\.(git|hg|svn|tox)|vendor$',
    \ }

"" nerdtree settings
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['.pyc$[[file]]', '.pyo$[[file]]']

"" Tabman settings
nmap <F9> :TMToggle<CR>

" Common file settings

"" Tab and indent settings
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

"" Markdown language
let g:vim_markdown_folding_disabled=1

"" EasyAlign mappings
:vmap <Enter> <Plug>(EasyAlign)
:nmap <Leader>a <Plug>(EasyAlign)

" Programming settings

"" Common programming settings
set colorcolumn=80,100
highlight ColorColumn ctermbg=4

"" Fold settings
set foldmethod=indent
set nofoldenable

"" Auto completion settings
set completeopt=menu

""" YouCompleteMe settings
let g:ycm_confirm_extra_conf=0
nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>
" 只能是 #include 或已打开的文件
nnoremap <leader>je :YcmCompleter GoToDefinition<CR>

"" Diff and patch settings
set diffopt=filler,vertical,context:3

"" Comment settings
let NERDSpaceDelims=1
let NERDRemoveExtraSpaces=1
let NERDCompactSexyComs=1

"" Tagging system settings

""" Cscope settings
set cscopetag
"# use quickfix window to display tagging result
set cscopequickfix=s-,c-,d-,i-,t-,e-,f-,g-

""" Tagbar settings
:nmap <F8> :TagbarToggle<CR>
let g:tagbar_sort=0
let g:tagbar_autofocus=1
let g:tagbar_foldlevel=0
let g:tagbar_autoshowtag=1

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

""" jedi-vim settings
let g:jedi#use_splits_not_buffers="winwidth"
let g:jedi#show_call_signatures=0

""" vim-flake8 settings
let g:flake8_show_in_gutter=1
let g:flake8_show_in_file=1
let g:flake8_quickfix_height=9
let g:no_flake8_maps=1
autocmd BufWritePost *.py call Flake8()

"" Go programming language
:augroup golang
:   autocmd!
:   autocmd FileType go nmap <leader>r <Plug>(go-run)
:   autocmd FileType go nmap <leader>b <Plug>(go-build)
:   autocmd FileType go nmap <leader>t <Plug>(go-test)
:   autocmd FileType go nmap <leader>c <Plug>(go-coverage)
:   autocmd FileType go nmap <Leader>ds <Plug>(go-def-split)
:   autocmd FileType go nmap <Leader>dv <Plug>(go-def-vertical)
:   autocmd FileType go nmap <Leader>dt <Plug>(go-def-tab)
:   autocmd FileType go nmap <Leader>s <Plug>(go-implements)
:   autocmd FileType go nmap <Leader>e <Plug>(go-rename)
:   autocmd FileType go nmap <Leader>i :GoImport 
:augroup END

let g:go_metalinter_autosave=1
let g:go_highlight_functions=1
let g:go_highlight_methods=1
let g:go_highlight_structs=1
let g:go_highlight_operators=1
let g:go_highlight_build_constraints=1

"" Java programming language
:augroup javaprograms
:   autocmd!
:   autocmd FileType java set shiftwidth=2 tabstop=2
:augroup END

"" HTML programming language
let g:user_emmet_install_global=0
:augroup htmljscss
:  autocmd!
:  autocmd FileType html,javascript,css EmmetInstall
:  autocmd FileType html,javascript,css set shiftwidth=2 tabstop=2
:augroup END

" Define functions

function! CodingUtf8()
    call append(line('.') - 1, '# -*- coding: utf-8 -*-')
    call cursor(line('.') + 1, 1)
endfunction

" Keyboard mappings
:nmap <Space> :nohl<CR>
:nnoremap <C-k>0 :vsplit<CR><C-w><C-w>:split<CR><C-w><C-w><C-w>
:nnoremap <C-k>8 :call CodingUtf8()<CR>
:nnoremap <F2> :botright copen<CR>
:nnoremap <F3> :cclose<CR>
:nnoremap <F6> :lopen<CR>
:nnoremap <F7> :lclose<CR>
:cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
:nnoremap <Leader>vp :VimuxPromptCommand<CR>
:nnoremap <Leader>vq :VimuxCloseRunner<CR>
:nnoremap <Leader>tc :tabclose<CR>
