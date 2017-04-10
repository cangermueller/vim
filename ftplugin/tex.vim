set formatoptions-=t
set wrap
set spelllang=en_gb

imap <buffer> [[     \begin{
imap <buffer> ]]     <Plug>LatexCloseCurEnv
nmap <buffer> <F5>   <Plug>LatexChangeEnv
vmap <buffer> <F7>   <Plug>LatexWrapSelection
vmap <buffer> <S-F7> <Plug>LatexEnvWrapSelection
imap <buffer> ((     \eqref{

" right option + ()
map  <silent> <buffer> ª :call LatexBox_JumpToNextBraces(1)<CR>
map  <silent> <buffer> º :call LatexBox_JumpToNextBraces(0)<CR>
imap <silent> <buffer> ª <C-R>=LatexBox_JumpToNextBraces(1)<CR>
imap <silent> <buffer> º <C-R>=LatexBox_JumpToNextBraces(0)<CR>

" Zotero citation
map <LocalLeader>c ~<ESC>:let @a = system("cite")<CR>"ap
imap <LocalLeader>c ~<ESC>:let @a = system("cite")<CR>"ap i
map <LocalLeader>C :let @a = system("cite citet")<CR>"ap i
imap <LocalLeader>C <ESC>:let @a = system("cite citet")<CR>"ap i

" Substitutions
map <LocalLeader>s& :.,$s/&/\\\&/gc<CR>
map <LocalLeader>s% :.,$s/\([^\\]\)%/\1\\%/gc<CR>
map <LocalLeader>s& :.,$s/\([^\\]\)\&/\1\\\&/gc<CR>
map <LocalLeader>sq :.,$s/‘\([^’]*\)’/`\1'/gc<CR>
map <LocalLeader>sQ :.,$s/“\([^’]*\)”/``\1''/gc<CR>
map <LocalLeader>sw :.,$s/’/'/gc<CR>
map <LocalLeader>sW :.,$s/‘/`/gc<CR>
map <LocalLeader>sm :.,$s/scM&T/scM\\\&T/gc<CR>
map <LocalLeader>sd :.,$s/—/--/gc<CR>

" Misc
map <LocalLeader>r /\w\d<CR>
map <LocalLeader>b /([^)]*)<CR>

" Temp
map <LocalLeader>lm :!make -f /Users/angermue/docs/phd/ebi/2017/thesis/phd_thesis/Makefile && open -a preview /Users/angermue/docs/phd/ebi/2017/thesis/phd_thesis/thesis.pdf<CR>

imap <LocalLeader>f \autoref{fig:}<ESC>i
imap <LocalLeader>F <ESC>ci)\autoref{fig:}<ESC>i
imap <LocalLeader>E (\autoref{fig:})<ESC>F}i
map <LocalLeader>f i\autoref{fig:}<ESC>i
map <LocalLeader>F ci)\autoref{fig:}<ESC>i
map <LocalLeader>E i(\autoref{fig:})<ESC>F}i

map <LocalLeader>d f(df)

