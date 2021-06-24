" Leader Key Maps

" Timeout
let g:which_key_timeout = 500

let g:which_key_display_names = {'<CR>': '↵', '<TAB>': '⇆', " ": 'SPC'}

let g:which_key_map =  {}

let g:which_key_sep = ' → '

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0
let g:which_key_max_size = 0

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

let g:which_key_map['/'] = 'comment toggle'
let g:which_key_map[';'] = [ ':Dashboard'            , 'home screen' ]
let g:which_key_map['?'] = [ ':NvimTreeFindFile'     , 'find current file' ]
let g:which_key_map['e'] = [ ':CocCommand explorer'       , 'explorer' ]
let g:which_key_map['f'] = [ ':Neoformat'            , 'format file' ]
let g:which_key_map['G'] = [ ':LazyGit'              , 'git' ]
let g:which_key_map['H'] = [ '<C-W>s'                , 'split below']
let g:which_key_map['h'] = [ ':let @/ = ""'          , 'no highlight' ]
let g:which_key_map['r'] = [ ':Telescope oldfiles'   , 'recent files' ]
let g:which_key_map['R'] = [ ':RnvimrToggle'         , 'ranger' ]
let g:which_key_map['p'] = [ ':Files' , 'find files' ]
let g:which_key_map['t'] = [ ':ToggleTerm'           , 'terminal' ]
let g:which_key_map['T'] = [ ':TodoQuickFix'         , 'TODO' ]
let g:which_key_map['v'] = [ '<C-W>v'                , 'split right']
let g:which_key_map['w'] = [ ':MaximizerToggle'      , 'max window']

" b is for buffer
let g:which_key_map.b = {
      \ 'name' : '+buffer'           ,
      \ '>' : [':BufferMoveNext'     , 'move next']       ,
      \ '<' : [':BufferMovePrevious' , 'move prev']       ,
      \ 'b' : [':BufferPick'         , 'pick buffer']     ,
      \ 'd' : [':BufferClose'        , 'delete-buffer']   ,
      \ 'n' : ['bnext'               , 'next-buffer']     ,
      \ 'p' : ['bprevious'           , 'previous-buffer'] ,
      \ 's' : [':Telescope buffers'  , 'buffers']         ,
      \ }
" d is for diagnostics
let g:which_key_map.d = {
            \ 'name' : '+diagnostics',
            \ 'n': [':Lspsaga diagnostic_jump_next', 'diagnostics next'],
            \ 'p': [':Lspsaga diagnostic_jump_prev', 'diagnostics prev'],
            \}

" d is for debug
let g:which_key_map.D = {
      \ 'name' : '+debug' ,
      \ 'b' : ['DebugToggleBreakpoint '        , 'toggle breakpoint'],
      \ 'c' : ['DebugContinue'                 , 'continue'],
      \ 'i' : ['DebugStepInto'                 , 'step into'],
      \ 'o' : ['DebugStepOver'                 , 'step over'],
      \ 'r' : ['DebugToggleRepl'               , 'toggle repl'],
      \ 's' : ['DebugStart'                    , 'start'],
      \ }

" F is for fold
let g:which_key_map.F = {
    \ 'name': '+fold'            ,
    \ 'O' : [':set foldlevel=20' , 'open all']  ,
    \ 'C' : [':set foldlevel=0'  , 'close all'] ,
    \ 'c' : [':foldclose'        , 'close']     ,
    \ 'o' : [':foldopen'         , 'open']      ,
    \ '1' : [':set foldlevel=1'  , 'level1']    ,
    \ '2' : [':set foldlevel=2'  , 'level2']    ,
    \ '3' : [':set foldlevel=3'  , 'level3']    ,
    \ '4' : [':set foldlevel=4'  , 'level4']    ,
    \ '5' : [':set foldlevel=5'  , 'level5']    ,
    \ '6' : [':set foldlevel=6'  , 'level6']
    \ }

" S is for Session
let g:which_key_map.g = {
      \ 'name' : '+Git'                    ,
      \ 's' : [':Gitsigns stage_hunk'      , 'stage hunk']      ,
      \ 'u' : [':Gitsigns undo_stage_hunk' , 'undo stage hunk'] ,
      \ 'r' : [':Gitsigns reset_hunk'      , 'reset hunk']      ,
      \ 'R' : [':Gitsigns reset_buffer'    , 'reset buffer']    ,
      \ 'p' : [':Gitsigns preview_hunk'    , 'preview hunk']    ,
      \ 'b' : [':Gitsigns blame_line'      , 'blame line']      ,
      \ }
" s is for search powered by telescope
let g:which_key_map.s = {
      \ 'name' : '+search'                                                         ,
      \ 'b' : [':Buffers'                                                , 'buffers'],
      \ 'f' : [':GFiles'                                             , 'files'],
      \ 's' : [':Rg'                                              , 'string'],
      \ 'T' : [':TodoTelescope'                                                    , 'TODO'],
      \ }

" S is for Session
let g:which_key_map.S = {
      \ 'name' : '+Session' ,
      \ 's' : [':SessionSave'           , 'save session'],
      \ 'l' : [':SessionLoad'           , 'load Session'],
      \ }

" l is for language server protocol
let g:which_key_map.l = {
      \ 'name' : '+lsp'                               ,
      \ 'a' : [':Lspsaga code_action'                 , 'code action']             ,
      \ 'A' : [':Lspsaga range_code_action'           , 'selected action']         ,
      \ 'd' : [':Telescope lsp_document_diagnostics'  , 'document diagnostics']    ,
      \ 'D' : [':Telescope lsp_workspace_diagnostics' , 'workspace diagnostics']   ,
      \ 'f' : [':LspFormatting'                       , 'format']                  ,
      \ 'h' : [':Lspsaga signature_help'              , 'signature help']          ,
      \ 'I' : [':LspInfo'                             , 'lsp info']                ,
      \ 'v' : [':LspVirtualTextToggle'                , 'lsp toggle virtual text'] ,
      \ 'l' : [':Lspsaga lsp_finder'                  , 'lsp finder']              ,
      \ 'L' : [':Lspsaga show_line_diagnostics'       , 'line_diagnostics']        ,
      \ 'p' : [':Lspsaga preview_definition'          , 'preview definition']      ,
      \ 'q' : [':Telescope quickfix'                  , 'quickfix']                ,
      \ 'r' : [':Lspsaga rename'                      , 'rename']                  ,
      \ 't' : [':LspTroubleToggle'                    , 'trouble']                 ,
      \ 'T' : [':LspTypeDefinition'                   , 'type defintion']          ,
      \ 'x' : [':cclose'                              , 'close quickfix']          ,
      \ 's' : [':Telescope lsp_document_symbols'      , 'document symbols']        ,
      \ 'S' : [':Telescope lsp_workspace_symbols'     , 'workspace symbols']       ,
      \ }

" Map leader to which_key
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

call which_key#register('<Space>', 'g:which_key_map')
