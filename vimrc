set nocompatible              " be iMproved, required
filetype off                  " required

" Basic setup
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent
set cindent
set number
set splitright
set splitbelow
set iskeyword+=:
set colorcolumn=80

" Syntax highlighting
syntax on
set background=dark

" Get rid of noises and flashes
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Is this for tmux?
if (has("termguicolors"))
  set termguicolors
endif

" Font
if has('gui_running')
    set guifont=Cousine\ Nerd\ Font\ Mono:h11
endif

" Ctrl+j/k will cycle through tabs
nmap <C-j> :bp!<CR>
nmap <C-k> :bn!<CR>

" Text files with long lines can still be navigated
au FileType markdown,html,tex,txt,text noremap <buffer> j gj
au FileType markdown,html,tex,txt,text noremap <buffer> k gk

" PLUGINS 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'bling/vim-airline'
Plugin 'rust-lang/rust.vim'
Plugin 'leafOfTree/vim-svelte-plugin'
Plugin 'rhysd/vim-clang-format'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'nvie/vim-flake8'
Plugin 'tell-k/vim-autopep8'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'tpope/vim-fugitive'
Plugin 'beyondmarc/glsl.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'morhetz/gruvbox'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'JuliaEditorSupport/julia-vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'vim-latex/vim-latex'
Plugin 'scrooloose/nerdtree'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'rakr/vim-one' 
Plugin 'joshdick/onedark.vim'
" Plugin 'reedes/vim-pencil'
Plugin 'fatih/vim-go'

" Plugin 'ycm-core/YouCompleteMe'
" Plugin 'w0rp/ale'
call vundle#end()            

filetype plugin indent on    " required

" COLOR SCHEME 
colorscheme gruvbox
" colorscheme dogrun
" colorscheme sierra
" colorscheme two-firewatch
" colorscheme 256_noir
let g:one_allow_italics=1
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_italicize_strings = '1'
let g:gruvbox_italicize_comments = '1'

"Rust
let g:rustfmt_autosave = 1

" NASM
augroup nasm_ft
  au!
  autocmd BufNewFile,BufRead *.nasm set ft=nasm
augroup END

" GLSL filetypes
augroup glsl_ft
  au!
  autocmd BufNewFile,BufRead *.frag,*.vert set ft=glsl
augroup END

"FLAKE8
let g:flake8_show_in_gutter = 1
let g:flake8_show_in_file = 1
let g:flake8_quickfix_height=1
augroup flake8_settings " {
    autocmd!
    autocmd BufWritePost *.py :call flake8#Flake8()
augroup end " }

"AUTOPEP8
let g:autopep8_on_save = 1
let g:autopep8_disable_show_diff=1
let g:autopep8_max_line_length=79

" ALE
let g:ale_completion_enabled = 1
let g:ale_linters = {'rust': ['rls'], 'C': ['ccls'], 'cpp': ['ccls'] }
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" : "\<TAB>"

"CLANG FORMAT
let g:clang_format#code_style = 'google'
augroup clang_settings " {
    autocmd!
    autocmd BufWritePost *.cpp,*.c,*.cc,*.h,*.hpp,*.proto ClangFormat
augroup end " }

" CTRLP 
" Fuzzy search through files 
" Press Ctrl+x to open horizontal, Ctrl+v for vertical
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'

"GLSL HIGHLIGHTING
let g:glsl_default_version = 'glsl330'
let g:glsl_file_extensions = '*.glsl,*.vsh,*.fsh,*.vert,*.tesc,*.tese,*.geom,*.frag,*.comp'

" NERD TREE
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" POWERLINE
let g:airline_powerline_fonts=0
let g:airline#extensions#tabline#enabled=0
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'


"VIM LATEX
filetype plugin on 
filetype indent on
let g:tex_flavor='latex'
set iskeyword+=:
let g:Tex_CustomTemplateDirectory='$HOME/.vim/latex-templates'
let g:Tex_FoldedSections=""
let g:Tex_FoldedEnvironments=""
let g:Tex_FoldedMisc=""

