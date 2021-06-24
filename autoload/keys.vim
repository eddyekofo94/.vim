" Keys:
" Which mappings for what
" Better indenting
vnoremap < <gv
vnoremap > >gv

" TODO: if it works in lua, REMOVE!"

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" TAB in general mode will move to text buffer
nnoremap <silent> <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <silent> <S-TAB> :bprevious<CR>

" Split to the right
nnoremap <leader>v :vsplit<CR>,l<CR>

" Move selected line / block of text in visual mode
" shift + k to move up
" shift + j to move down
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" HARD MODE - Disabled arrows
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Very magic by default, got this from theRimragen (Don't knoq exactly what it
" does
nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %sm/

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <C-c> <esc>
imap jj <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
" I don't really agree with this setup but I will keep it here if I ever
" find it decesarry one day
" inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Change the current word in insertmode.
"   Auto places you into the spot where you can start typing to change it.
nnoremap <c-r>w :%s/<c-r><c-w>//g<left><left>

nnoremap Y  y$ " Thank you TPope

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Remap for do codeAction of selected region,
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

nmap <silent><leader>/ :Commentary<CR>
xmap <silent><leader>/ :Commentary<CR>

" TODO: fix adding lines above & below
" nmap <silent><leader>oo :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
" nmap <silent><leader>OO :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>

nmap <silent><C-o> :CocCommand clangd.switchSourceHeader<CR>
nmap <S-x> :bdelete<CR>

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" NOTE: Look into this, it looks like a good idea
" Pressing the letter o will open a new line below the current one.
" Exit insert mode after creating a new line above or below the current line.
" INFO: Messes up the auto indent
" nnoremap o o<esc>
" nnoremap O O<esc>

" Center the cursor vertically when moving to the next word during a search.
nnoremap n nzz
nnoremap N Nzz
