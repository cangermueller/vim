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
nmap <LocalLeader>jI <LocalLeader>ji <c-w>T
nmap <LocalLeader>jp :call CocActionAsync('jumpDefinition', v:false)<cr>
nmap <LocalLeader>jJ <Plug>(coc-declaration)
nmap <LocalLeader>jr <Plug>(coc-references-used)
nmap <LocalLeader>jR <Plug>(coc-rename)
xmap <LocalLeader>jf <Plug>(coc-format-selected)
nmap <LocalLeader>jf <Plug>(coc-format-selected)l
nmap <LocalLeader>jF <Plug>(coc-format)
nmap <LocalLeader>jt <Plug>(coc-type-definition)
nmap <LocalLeader>jA <Plug>(coc-codeaction)
nmap <LocalLeader>ja <Plug>(coc-codeaction-cursor)

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('jd', 'in')
  endif
endfunction

nnoremap <LocalLeader>jd :call ShowDocumentation()<CR>

nmap <space>dd :CocDiagnostics<cr>
nmap <space>ds :call CocAction('diagnosticPreview')<cr>
nmap <space>df <Plug>(coc-codeaction-line)
nmap <space>dg <Plug>(coc-fix-current)
nmap <space>dt :call CocAction('diagnosticToggle')<cr>
nmap <space>dr :call CocAction('diagnosticRefresh')<cr>
nmap <silent><space>dj <Plug>(coc-diagnostic-next)
nmap <silent><space>dk <Plug>(coc-diagnostic-prev)
:autocmd FileType qf nmap <buffer> <cr> <cr>:lcl<cr>


" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')


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
