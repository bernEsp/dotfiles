" Sections:                                                                  "
"   01. General ................. General Vim behavior                       "
"   02. Bundle .................. List of pluggins                           "
"   03. General events autoloads........ auto cmd load                       "
"   03. Theme/Colors ............ Colors, fonts, etc.                        "
"   04. Vim UI .................. User interface behavior                    "
"   05. Mapping ................. Mapping keys
"   06. Text Formatting/Layout .. Text, tab, indentation related             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 01. General                                                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible         " get rid of Vi compatibility mode. SET FIRST!
let mapleader=","        " set my leader!
set backupdir^=~/.vim/_backup//    " where to put backup files.
set directory^=~/.vim/_temp//
set path+=**
set wildmenu
set wildmode=list:longest
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=.git\*,.hg\*,.svn\*
else
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 02. Bundle                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off                  " required!
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/vundles/
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'VundleVim/Vundle.vim'

" My bundles here:
"
" original repos on GitHub
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-pathogen'
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-unimpaired'
Plugin 'kien/ctrlp.vim.git'
Plugin 'rking/ag.vim.git'
Plugin 'airblade/vim-gitgutter.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'sunaku/vim-ruby-minitest'
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-dispatch'
Plugin 'antlypls/vim-colors-codeschool'
Plugin 'burnettk/vim-angular'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'jez/vim-github-hub'

call vundle#end()
" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install (update) bundles
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 03. Events                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]
"set rspec command
let g:rspec_command = "Dispatch rspec {spec}"
" open nerd tree if exist
" In Ruby files, use 2 spaces instead of 4 for tabs
autocmd FileType ruby setlocal sw=2 ts=2 sts=2
" open nerd tree if exist
autocmd vimenter * if !argc() | NERDTree | endif
" stick to vim closes if close
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
      \ if &omnifunc == "" |
      \ setlocal omnifunc=syntaxcomplete#Complete |
      \ endif
endif
" delete trailining whitespaces
autocmd BufWritePre * %s/\s\+$//e
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 04. Theme/Colors                                                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
colorscheme codeschool    " set colorscheme
set colorcolumn=80

" Highlight characters that go over 80 columns
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
highlight CursorLine ctermfg=NONE ctermbg=240 cterm=NONE guifg=NONE guibg=#2e373b gui=NONE

match OverLength /\%81v.\+/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 04. Vim UI                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number                " show line numbers
set cul                   " highlight current line
set hlsearch              " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set ruler                 " Always show info along bottom.
set smartcase             " ... unless they contain at least one capital letter
set showmatch
set vb                    " enable visual bell
set laststatus=2          " last window always has a statusline
let g:NERDTreeWinPos = "right"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 05. Mapping                                                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>n :NERDTreeToggle<CR>
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>
map <leader>l :wincmd l<CR>
map <leader>k :wincmd k<CR>
map <leader>j :wincmd j<CR>
map <leader>h :wincmd h<CR>
let g:ctrlp_map = '<leader>f'
let g:ctrlp_cmd = 'CtrlP'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 06. Text Formatting/Layout                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent            " auto-indent
set encoding=utf-8        " enconding with utf-8
set fileencoding=utf-8    " force file enconding to utf-8 and mitigate issues
set tabstop=2             " tab spacing
set softtabstop=2         " unify
set shiftwidth=2         " indent/outdent by 2 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smarttab              " use tabs at the start of a line, spaces elsewhere
set nowrap                " don't wrap text
set backspace=indent,eol,start
set textwidth=79
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp set up                                                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn))|(coverage|coverage_old|dist|bin|node_modules|coverage-old)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_dont_split = 'nerdtree'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Angular vim set up                                                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:angular_source_directory = ['src/']
let g:angular_test_directory = ['tests/unit']
let g:angular_find_ignore = ['build/', 'dist/', 'node_modules/', 'coverage/', 'bin/', 'coverage-old/']
let g:angular_jasmine_version = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" pangloss/vim-javascript vim set up                                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Javascripts Libraries syntax                                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:used_javascript_libs = 'angularjs,angularui,angularuirouter,requirejs,jasmine'
