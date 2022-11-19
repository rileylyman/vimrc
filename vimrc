set nocompatible " be iMproved, required
filetype off     " required
filetype plugin indent on    " required

let mapleader="m"

" Syntax highlighting
syntax on
set background=dark

" Get rid of noises and flashes
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" spell checking
set spell

" Tabz
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set cindent

" Allow mouse clicks
set mouse=a

" Show line numbers on the left
set number

" ??? https://github.com/vim/vim/issues/1735#issuecomment-383353563 
set lazyredraw

set encoding=utf-8

set iskeyword+=:

" Show the line length limit
set colorcolumn=80
au Filetype rust set colorcolumn=100
set sidescrolloff=5

" Show %s/ changes as it happens
set inccommand=nosplit

" Weird, dunno
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

" http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
set timeoutlen=300

" Allow multiple buffers w/ active changes
set hidden

" Keep 2 lines above/below cursor when I reach top/bottom of page
set scrolloff=2

" Keep the gutter to the left so buffer doesn't move around
set signcolumn=yes
" Don't display -- INSERT -- etc at the bottom
set noshowmode

" Don't wrap long lines to next line
set nowrap

" Sane splitting
set splitright
set splitbelow

" Permanent undo
set undodir=~/.vimdid
set undofile
set history=1000

" Proper search
set incsearch
set ignorecase
set smartcase
set gdefault

" Tab complete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <Esc> <C-\><C-N>

" Text files with long lines can still be navigated
nnoremap <buffer> j gj
nnoremap <buffer> k gk

" Center search results
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" I can type :help on my own, thanks.
map <F1> <Esc>
imap <F1> <Esc>

" Very magic by default
nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %sm/

" Easier splits
nnoremap <leader>v :vsplit
nnoremap <leader>s :split
nnoremap <leader>e :e

" Exit paste mode when leaving insert
autocmd InsertLeave * set nopaste

" Is this for tmux?
if (has("termguicolors"))
  set termguicolors
endif

" Font
if has('gui_running')
    set guifont=Cousine\ Nerd\ Font\ Mono:h11
endif

" PLUGINS 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Conqueror of completion.
"
" :CocInstall coc-pyright
" :CocInstall coc-rust-analyzer
" :CocInstall coc-toml
" :CocInstall coc-prettier
" :CocInstall coc-tsserver
" :CocInstall coc-svelte
" :CocInstall coc-flutter
Plugin 'neoclide/coc.nvim', {'branch': 'release'}

" Rust formatting and errors, not sure how this plays with CoC
Plugin 'rust-lang/rust.vim'

" Run clang-format inside of vim
Plugin 'rhysd/vim-clang-format'

" Syntax highlighting for almost every language
Plugin 'sheerun/vim-polyglot'

" Toggle between relative and normal line numbers automagically
Plugin 'jeffkreeftmeijer/vim-numbertoggle'

" CTRL+n displays file tree
Plugin 'scrooloose/nerdtree'

" Show git +/-/~ signs in the gutter
Plugin 'airblade/vim-gitgutter'

" Mostly so I can run :Gblame
Plugin 'tpope/vim-fugitive'

" Best colorscheme ever
Plugin 'morhetz/gruvbox'

" Python formatting.
Plugin 'psf/black', {'branch': 'stable'}
Plugin 'fisadev/vim-isort'

" Airline at bottom of screen.
Plugin 'bling/vim-airline'

" History for yanks
Plugin 'maxbrunsfeld/vim-yankstack'

" Jai!
Plugin 'jansedivy/jai.vim'

Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'evanleck/vim-svelte', {'branch': 'main'}

call vundle#end()            

" Colorscheme
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'medium'

"Rust
let g:rustfmt_autosave = 1

let g:syntastic_auto_jump = 0

" C/C++ autofmt
let g:clang_format#code_style = 'google'
augroup clang_settings
    autocmd!
    autocmd BufWritePost *.cpp,*.c,*.cc,*.h,*.hpp,*.proto,*.ino ClangFormat
augroup end

" Python autofmt
let g:black_quiet = 1
augroup pyblack
    autocmd!
    autocmd BufWritePost *.py Black
    autocmd BufWritePost *.py Isort
augroup end

" NASM highlighting
augroup nasm_ft
  au!
  autocmd BufNewFile,BufRead *.nasm set ft=nasm
augroup END

" GLSL highlighting
augroup glsl_ft
  au!
  autocmd BufNewFile,BufRead *.frag,*.vert set ft=glsl
augroup END

"Jai indentation
augroup jai
  au!
  autocmd BufNewFile,BufRead *.jai set tabstop=4
  autocmd BufNewFile,BufRead *.jai set softtabstop=4
  autocmd BufNewFile,BufRead *.jai set shiftwidth=4
augroup END

" NERD TREE
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" vim-airline config
let g:airline_powerline_fonts=0
let g:airline#extensions#tabline#enabled=0
