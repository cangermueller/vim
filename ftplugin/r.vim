let R_in_buffer = 0
let R_applescript = 0
let R_tmux_split = 1
let R_notmuxconf = 1
let R_assign = 1
let R_assign_map = "<C-j>"
let R_insert_mode_cmds = 1 "allow commands in insert mode -> see .vim/r-plugin/common_global.vim: function RCreateMaps
let rrst_syn_hl_chunk = 1 "syntax highlight chunck options
let rmd_syn_hl_chunk = 1 "syntax highlight chunck options
let R_openpdf = 1 "automatically open pdf. \kop to open pdf
let R_openhtml = 1
let Rout_more_colors=1
let R_vimpager='tabnew' "tabnew, vertical, tabnew, horizontal, vim --servername VIM!
let R_vsplit = 1
let R_show_args = 1
let R_objbr_place = "script,left"
let R_indent_align_args = 0
let R_vimcom_wait = -1


" ==============================================================================
" Misc
" ==============================================================================
map <Leader>c<space> <LocalLeader>xx
cabbr Rh Rhelp
imap <c-k> <Space>%>%<Space>
imap <c-l> <Space>%>%
" open safely to avoid seqfault
map <LocalLeader>rF :tab new .tmp.Rmd<CR><LocalLeader>rf<c-w>q


" ==============================================================================
" Sending
" ==============================================================================
nmap <LocalLeader>w <Plug>RSendLine
imap <LocalLeader>w <Plug>RSendLine
nmap <LocalLeader>d <Plug>RDSendLine
nmap <LocalLeader>q <Plug>RSendLine o


" ==============================================================================
" Inserting paragraphs
" ==============================================================================
map <LocalLeader>i i```{r}<CR>```<c-o>O
imap <LocalLeader>i ```{r}<CR>```<c-o>O
map <LocalLeader>S i<CR>```{r}<CR>opts_chunk$set(eval=F)<CR>```<CR>
imap <LocalLeader>S ```{r}<CR>opts_chunk$set(eval=F)<CR>```<CR>
map <LocalLeader>I i```<CR><CR>```{r}
imap <LocalLeader>I ```<CR><CR>```{r}
imap <silent> <LocalLeader>a <Plug>RCompleteArgs
map <LocalLeader>sic :?^```{r?+1<CR>V /^```/-1<CR>
map <LocalLeader>sac :?^```{r?<CR>V /^```/<CR>


" ==============================================================================
" Navigation
" ==============================================================================
map <LocalLeader>cj <LocalLeader>gn
map <LocalLeader>ck <LocalLeader>gN
imap <LocalLeader>cj <c-o><LocalLeader>gn
imap <LocalLeader>ck <c-o><LocalLeader>gN
map <LocalLeader>ct <LocalLeader>ch


" ==============================================================================
" Printing infos
" ==============================================================================
map <silent> <LocalLeader>rj :call RAction("head")<CR>
map <silent> <LocalLeader>rk :call RAction("dim")<CR>
map <silent> <LocalLeader>ry :call RAction("glimpse")<CR>
map <silent> <LocalLeader>rz :call RAction("levels")<CR>
map <silent> <LocalLeader>r. :call SendCmdToR("list.files()")<CR>
imap <LocalLeader>rP <c-o>^<LocalLeader>rp<c-o>$
imap <LocalLeader>rT <c-o>^<LocalLeader>rt<c-o>$
map <LocalLeader>rP ^<LocalLeader>rp$
map <LocalLeader>rT ^<LocalLeader>rt$
map <LocalLeader>rY ^<LocalLeader>ry$
map <LocalLeader>rJ ^<LocalLeader>rj$


" ==============================================================================
" Knit
" ==============================================================================
map <LocalLeader>kz :w<CR> :call SendCmdToR('library(rmarkdown); render("' . expand("%:t") . '")') <CR>
map <LocalLeader>kx :w<CR> :call SendCmdToR('library(rmarkdown); setwd("' . expand("%:p:h") . '"); run("' . expand("%:t") . '")') <CR>
" knit command that works on mounted devices
map <LocalLeader>kj :w<CR> :call SendCmdToR('library(rmarkdown); render("' . expand("%:t") . '", output_format="html_document"); ') <CR>
map <LocalLeader>kc :!rm -rf %:p:h/*_cache/ <CR><CR>
map <LocalLeader>oh :!f=%; f=${f\%.*}.html; open -a firefox $f <CR><CR>
