if executable('fish')
    " use fish for embedded terminals
    set shell=fish
    " use bash for else
    let $SHELL = 'bash'
endif

filetype off                 " required
" g Leader key: This has to be done early
let mapleader=" "
let localleader=" "

nnoremap <Space> <Nop>
set laststatus=2

call plug#begin('~/.vim/plugged')
" On-demand lazy load
Plug 'liuchengxu/vim-which-key'
Plug 'numtostr/gruvbox-material'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'mbbill/undotree'
Plug 'tpope/vim-surround'
Plug 'szw/vim-maximizer'
Plug 'ryanoasis/vim-devicons'
Plug 'pacha/vem-tabline'
Plug 'airblade/vim-gitgutter'
Plug 'blankname/vim-fish'
Plug 'mhinz/vim-startify'
Plug 'psliwka/vim-smoothie'
" Plug 'Yggdroot/indentLine'

Plug 'bfrg/vim-cpp-modern'
Plug 'jackguo380/vim-lsp-cxx-highlight'

" Initialize plugin system
call plug#end()

source ~/.vim/after/which-key.vim
source ~/.vim/autoload/keys.vim

if !has('gui_running')
    set t_Co=256
    " Display more of the file by default.
    " Hide the toolbar.
    set guioptions-=T

    " Hide the the left-side scroll bar.
    set guioptions-=L

    " Hide the the left-side scroll bar.
    set guioptions-=r

endif
colo onedark
" Sets: - general conghigs
set nocompatible
set exrc                                " For custumised vim setting (will load vim files in project) No
set icon

set background=dark
set iskeyword+=-                        " treat dash separated words as a word text object"
set formatoptions-=cro                  " Stop newline continution of comments

set nowrap                              " Display long lines as just one line
set whichwrap+=<,>,[,],h,l
set encoding=utf-8     " The encoding displayed
set pumheight=10       " Makes popup menu smaller
set fileencoding=utf-8 " The encoding written to file
set ruler              " Show the cursor position all the time
set mouse+=a           " Enable your mouse
set splitbelow         " Horizontal splits will automatically be below
set splitright         " Vertical splits will automatically be to the right
set conceallevel=0     " So that I can see `` in markdown files
set cursorline         " Enable highlighting of the current line
set cursorcolumn       " Enable column highlight
set showtabline=2      " Always show tabs
set tabstop=4          " Insert 4 spaces for a tab
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set cindent        " C based indenting :h cindent to read more"
set autoread
set smartindent
set smartcase
set relativenumber
set number
set hidden                              " Keep all the buffers open in the background
set noerrorbells
set noswapfile
set nobackup
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set shiftround                          " For better indentation"
set clipboard=unnamed               " Copy paste between vim and everything else
set nowritebackup                       " This is recommended by coc
set undodir=~/.vim/undodir  " Need a proper pluggin for it, all for keeping files saved
set undofile
set termguicolors
set scrolloff=10                         " start scholling when you're near the bottom by 8
set sidescrolloff=6
set noshowmode                          " Get rid of --INSERT-- etc... don't need it
" Show matching words during a search.
set showmatch
set complete+=kspell                    " INFO: :take a look into this option"
set completeopt=menuone,noinsert,noselect
set virtualedit=block
set signcolumn=yes                      " It sets the collum in the gutter for linting sake
set hlsearch
syntax enable                           " Enabling syntax highlight
set backspace=indent,eol,start          " Works for indenting on Macos
filetype plugin indent on

" Decent wildmenu
" set wildmode=longest:full,full
set wildmenu
set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor
" set wildoptions=pum

" Gibe more space for displaying
set cmdheight=2

" Shorter update time for good user experience
set updatetime=50

" Don't pass messages to | ins-completion-menu | .
set shortmess+=c

set lazyredraw
set diffopt+=iwhite " No whitespace in vimdiff
" Make diffing better: https://vimways.org/2018/the-power-of-diff/
set diffopt+=algorithm:patience
set diffopt+=indent-heuristic
set synmaxcol=500
set nofoldenable
set ttyfast
" Proper search
set incsearch
set ignorecase
set smartcase
set gdefault
set path+=**
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set list
" settings for hidden chars
set list
set listchars=tab:→\ ,nbsp:␣,trail:•,eol:↵,precedes:«,extends:»

set foldmethod=expr
" Leave paste mode when leaving insert mode
autocmd InsertLeave * set nopaste
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_winsize = 25
" let g:netrw_localrmdir='rm -r'

" fzf window position settings
let g:fzf_preview_direct_window_option = 'right'

augroup AutoDeleteNetrwHiddenBuffers
  au!
  au FileType netrw setlocal bufhidden=wipe
augroup end

function! MaxLineChars()
    let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endfunction


augroup MAX_CHARS_COLUMN
    autocmd!
    autocmd FileType cpp,h,hpp,cxx,cs,fish,bash,ru,ts,java,php,lua,javascript :call MaxLineChars()
    autocmd BufLeave * :call clearmatches()
augroup END

" Remove whitespace
function! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup THE_ED_CLEAN
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

" Jump to last edit position on opening file
if has("autocmd")
  " https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
  au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" You can't stop me
cmap w!! w !sudo tee %
cmap W w
cmap Q q

" inoremap <M-I>      <C-O>^ "TODO see the def of this mapping from TPope

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }

let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '▎'
let g:gitgutter_sign_removed = '契'
let g:gitgutter_sign_removed_first_line = '契'
let g:gitgutter_sign_removed_above_and_below = '契'

" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn
augroup END

" Theme & colors
highlight CursorLineNr guifg=#d3869b
highlight Visual cterm=reverse gui=reverse
highlight HighlightedyankRegion cterm=reverse gui=reverse
highlight Cursor cterm=reverse gui=reverse
