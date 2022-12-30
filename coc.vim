" ==============================================================================
" COC: Conquer Of Completion settings
" ==============================================================================

" Avoid delays by reducing the update time
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-space> to trigger completion
if has('nvim')
  imap <silent><expr> <c-space> coc#refresh()
else
  imap <silent><expr> <c-@> coc#refresh()
endif

nmap <LocalLeader>jj <Plug>(coc-definition)
nmap <LocalLeader>ji :vert split \| call CocActionAsync('jumpDefinition')<cr>zt
nmap <LocalLeader>jI :vert split \| call CocActionAsync('jumpDefinition')<cr>zt
nmap <LocalLeader>jJ <Plug>(coc-declaration)
nmap <LocalLeader>jr <Plug>(coc-references-used)
nmap <LocalLeader>jR <Plug>(coc-rename)
nmap <LocalLeader>jf <Plug>(coc-fix-current)
nmap <LocalLeader>jG <Plug>(coc-format)
nmap <LocalLeader>jg <Plug>(cc-format-selected)
nmap <LocalLeader>jt <Plug>(coc-type-definition)

nmap <LocalLeader>je :CocList diagnostics<cr>
nmap <c-a>n :CocList outline<cr>

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Clsoe the location list when selecting the first item
:autocmd FileType qf nmap <buffer> <cr> <cr>:lcl<cr>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('jd', 'in')
  endif
endfunction

nnoremap <LocalLeader>jd :call ShowDocumentation()<CR>


" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <LocalLeader>jA <Plug>(coc-codeaction)
nmap <LocalLeader>ja <Plug>(coc-codeaction-cursor)

" Enable selecting the content of a function or class.
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
