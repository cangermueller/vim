map <Leader>cr :1,/^}/s/^\(\s\+\)eval \$cmd/\1# eval $cmd/g<cr><c-o>:w<cr>
map <Leader>cR :1,/^}/s/\(# \)\+eval \$cmd/eval $cmd/g<cr><c-o>:w<cr>
