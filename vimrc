set nocompatible              " be iMproved, required
filetype off                  " required

" Basic setup
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set cindent
set number
set splitright
set splitbelow

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
Plugin 'bling/vim-airline'
Plugin 'w0rp/ale'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'beyondmarc/glsl.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'morhetz/gruvbox'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'JuliaEditorSupport/julia-vim'
Plugin 'vim-latex/vim-latex'
Plugin 'scrooloose/nerdtree'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'rakr/vim-one' 
Plugin 'joshdick/onedark.vim'
Plugin 'reedes/vim-pencil'
call vundle#end()            
filetype plugin indent on    " required

" COLOR SCHEME 
colorscheme onedark
let g:one_allow_italics=1
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_italicize_strings = '1'
let g:gruvbox_italicize_comments = '1'

" ALE
let g:ale_completion_enabled = 1
let g:ale_linters = {'rust': ['rls'], 'C': ['gcc'] }

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


" YOU COMPLETE ME
set completeopt=noinsert,menuone,noselect
" tab to select
" and don't hijack my enter key
inoremap <expr><Tab> (pumvisible()?(empty(v:completed_item)?"\<C-n>":"\<C-n>"):"\<Tab>")
inoremap <expr><S-Tab> (pumvisible()?"\<C-p>":"\<S-Tab>")
inoremap <expr><CR> (pumvisible()?(empty(v:completed_item)?"\<CR>\<CR>":"\<C-y>"):"\<CR>")

"VIM LATEX
filetype plugin on 
filetype indent on
let g:tex_flavor='latex'
set iskeyword+=:
let g:Tex_CustomTemplateDirectory='$HOME/.vim/latex-templates'
let g:Tex_FoldedSections=""
let g:Tex_FoldedEnvironments=""
let g:Tex_FoldedMisc=""

"VIM PENCIL
augroup Pencil
    autocmd!
    autocmd FileType markdown,mkd,md call pencil#init()
    autocmd FileType text call pencil#init()
augroup END
