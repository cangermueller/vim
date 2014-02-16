imap <buffer> [[     \begin{
imap <buffer> ]]     <Plug>LatexCloseCurEnv
nmap <buffer> <F5>   <Plug>LatexChangeEnv
vmap <buffer> <F7>   <Plug>LatexWrapSelection
vmap <buffer> <S-F7> <Plug>LatexEnvWrapSelection
imap <buffer> ((     \eqref{

map  <silent> <buffer> ª :call LatexBox_JumpToNextBraces(1)<CR>
map  <silent> <buffer> º :call LatexBox_JumpToNextBraces(0)<CR>
imap <silent> <buffer> ª <C-R>=LatexBox_JumpToNextBraces(1)<CR>
imap <silent> <buffer> º <C-R>=LatexBox_JumpToNextBraces(0)<CR>
