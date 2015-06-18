let vimrplugin_notmuxconf = 1
let vimrplugin_assign = 1
let vimrplugin_assign_map = "<C-j>"
let vimrplugin_insert_mode_cmds = 1 "allow commands in insert mode -> see .vim/r-plugin/common_global.vim: function RCreateMaps
let rrst_syn_hl_chunk = 1 "syntax highlight chunck options
let rmd_syn_hl_chunk = 1 "syntax highlight chunck options
let vimrplugin_openpdf = 1 "automatically open pdf. \kop to open pdf
let vimrplugin_openhtml = 1
let Rout_more_colors=1
let vimrplugin_vimpager='no' "tabnew, vertical, tabnew, horizontal
let vimrplugin_vsplit = 1
let vimrplugin_show_args = 1
let vimrplugin_objbr_place = "script,left"
let r_indent_align_args = 0
let vimrplugin_vimcom_wait = -1


" open safely to avoid seqfault
map <LocalLeader>rF :tab new .tmp.Rmd<CR><LocalLeader>rf<c-w>q
nmap <LocalLeader>w <Plug>RSendLine
imap <LocalLeader>w <Plug>RSendLine
nmap <LocalLeader>d <Plug>RDSendLine
nmap <LocalLeader>q <Plug>RSendLine o
map <LocalLeader>i i```{r}<CR>```<c-o>O
imap <LocalLeader>i ```{r}<CR>```<c-o>O
map <LocalLeader>I i```<CR><CR>```{r}<CR>
imap <LocalLeader>I ```<CR><CR>```{r}<CR>
imap <silent> <LocalLeader>a <Plug>RCompleteArgs
map <silent> <LocalLeader>rj :call RAction("head")<CR>
map <silent> <LocalLeader>rk :call RAction("dim")<CR>
map <silent> <LocalLeader>ry :call RAction("glimpse")<CR>
map <silent> <LocalLeader>rz :call RAction("levels")<CR>
map <silent> <LocalLeader>r. :call SendCmdToR("list.files()")<CR>
map <LocalLeader>kz :w<CR> :call SendCmdToR('library(rmarkdown); render("' . expand("%:t") . '")') <CR>
map <LocalLeader>kx :w<CR> :call SendCmdToR('library(rmarkdown); setwd("' . expand("%:p:h") . '"); run("' . expand("%:t") . '")') <CR>
map <LocalLeader>cn <LocalLeader>gn
map <LocalLeader>cN <LocalLeader>gN
imap <LocalLeader>cn <c-o><LocalLeader>gn
imap <LocalLeader>cN <c-o><LocalLeader>gN
map <LocalLeader>sic :?^```{r?+1<CR>V /^```/-1<CR>
map <LocalLeader>sac :?^```{r?<CR>V /^```/<CR>
imap <c-k> <Space>%>%<Space>
imap <c-l> <Space>%>%
imap <LocalLeader>rP <c-o>^<LocalLeader>rp<c-o>$
imap <LocalLeader>rT <c-o>^<LocalLeader>rt<c-o>$
map <LocalLeader>rP ^<LocalLeader>rp$
map <LocalLeader>rT ^<LocalLeader>rt$
map <LocalLeader>rY ^<LocalLeader>ry$
map <LocalLeader>rJ ^<LocalLeader>rj$
map <LocalLeader>ct <LocalLeader>ch
map <LocalLeader>oh :!f=%; f=${f\%.*}.html; open -a firefox $f <CR><CR>
map <LocalLeader>kc :!rm -rf *_cache/ <CR><CR>


cabbr Rh Rhelp
