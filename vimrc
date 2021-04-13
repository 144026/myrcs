" general vim config "
set nocompatible

if $TERM ==# 'linux'
	set notermguicolors
else
	set termguicolors " for base16 colorschemes
endif

syntax enable

set number
set cursorline
set showmatch " show matching brackets
set showcmd " show partial commands
set wildmenu " show a menu for selection after tab-completion

set cindent
set tabstop=4
set noexpandtab
set shiftwidth=4

set incsearch
set hlsearch

set ignorecase " for search and tab completion
set smartcase

set encoding=utf-8
set autowrite " auto write before :next, :make,...
set nobackup
set noundofile
set history=1000

" to learn
set hidden "hide buffers when they're abandoned
set mouse=a " enable mouse on all modes
"behave xterm
"behave mswin




" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
	au!
	autocmd BufRead,BufNewFile *.service setfiletype systemd

	""""""""""""""""""""""""""""""""""""""""""""""""
	" For all text files set 'textwidth' to 78 characters.
	autocmd FileType text setlocal textwidth=78
	" LaTeX autocmds
	" conceal latex file
	autocmd Filetype tex setl conceallevel=1
	" used for latex live preview
	autocmd Filetype tex setl updatetime=1000
	autocmd Filetype tex,python setl expandtab
	" vimtex auto clean
	" autocmd User VimtexEventQuit call vimtex#latexmk#clean(0)
augroup END



" vim-plug and plugin config
call plug#begin('~/.vim/plugged')

"Interface{{{
" Plug 'altercation/vim-colors-solarized' " bad support for terminal vim
Plug 'chriskempson/base16-vim'
if !has('gui_running')
	set background=dark
	colorscheme base16-solarized-dark
else
	set background=light
	colorscheme base16-solarized-light
	set guioptions-=T
	set guioptions-=r
	set guifont=Fira\ Code\ weight=453\ 14
endif

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='base16_solarized'

Plug 'godlygeek/tabular'

Plug 'sirver/ultisnips'
"}}}


"Integrations{{{
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
"}}}


"Markdown{{{""
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
let g:vim_markdown_math = 1
let g:vim_markdown_strike_through = 1
let g:vim_markdown_new_list_item_indent = 4
let g:vimtex_compiler_latexmk = { 'build_dir' : 'build' }

Plug 'iamcco/mathjax-support-for-mkdp', { 'for': 'markdown' }

Plug 'iamcco/markdown-preview.vim', { 'for': 'markdown' }
nmap <silent> <F8> <Plug>MarkdownPreview
imap <silent> <F8> <Plug>MarkdownPreview
nmap <silent> <F9> <Plug>StopMarkdownPreview
imap <silent> <F9> <Plug>StopMarkdownPreview
"}}}
"

"Tex Support{{{
Plug 'lervag/vimtex', { 'for': 'tex' }
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=1
let g:tex_conceal='abdmg'
" :help g:tex_conceal

Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
let g:livepreview_previewer = 'zathura -c ~/.config/zathura/'
let g:livepreview_engine = 'xelatex' " . ' -output-directory=./xelatex-outputs'
nmap <silent> <F10> :LLPStartPreview<cr>
imap <silent> <F10> <Esc>:LLPStartPreview<cr>
"}}}

call plug#end()
