set nocompatible
set term=xterm-256color

" VIM Plugins (vim-plug)
" "
" -----------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')  " Plugins will be installed in this folder

" Visual
"Plug 'flazz/vim-colorschemes'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'fcpg/vim-orbital'
Plug 'mhartington/oceanic-next'
Plug 'Glench/Vim-Jinja2-Syntax'

" General Purpose Plugins
Plug 'ciaranm/detectindent'

" Python Plugins
Plug 'dense-analysis/ale'
Plug 'vim-scripts/indentpython.vim'
Plug 'hynek/vim-python-pep8-indent'

" Docker Plugins
Plug 'ekalinin/Dockerfile.vim'

" Yaml
Plug 'stephpy/vim-yaml'



call plug#end()
"
"colorscheme orbital
colorscheme OceanicNext

" Indentation settings
" "
" -----------------------------------------------------------------------------
set autoindent                  " always set autoindenting on
set shiftwidth=4                " Force indentation to be 4 spaces
set tabstop=4                   "          -- idem --
set list                        " EOL, trailing spaces, tabs: show them.
set lcs=tab:├─                  " Tabs are shown as ├──
set lcs+=trail:␣                " Show trailing spaces as ␣
set expandtab                   " always expand tabs to spaces
set backspace=2                 " make backspace behave like in most otherapps

" Visual Mode settings
" "
" -----------------------------------------------------------------------------
set hlsearch                    " Hightlight searches
set ignorecase                  " Ignore case when searching
set smartcase                   " Override the ignorecase when search contains upper letters
vnoremap < <gv                  " indent'>' multiple times in visual mode
vnoremap > >gv                  " indent'<' multiple times in visual mode

" Display
" "
" -----------------------------------------------------------------------------
set number relativenumber       " display relative numbers" set foldcolumn=2 display up to 4 folds
set nowrap                      " Prevent wrapping
set title                       " display title in X.
set visualbell t_vb=            " disable visualbells completely
"set cursorline                  " highlight the current line
set termguicolors               " Enable Truecolor support
"set cursorcolumn                " hightlight the current column

let g:airline_powerline_fonts = 1
