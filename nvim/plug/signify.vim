let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '¯'
let g:signify_sign_change            = '~'

let g:signify_sign_show_count = 0
let g:signify_sign_show_text  = 1

nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nmap <leader>gJ 9999<leader>gJ
nmap <leader>gK 9999<leader>gK

highlight SignifyLineAdd    cterm=bold ctermbg=NONE ctermfg=green
highlight SignifyLineDelete cterm=bold ctermbg=NONE ctermfg=red
highlight SignifyLineChange cterm=bold ctermbg=NONE ctermfg=yellow
highlight SignifySignAdd    cterm=bold ctermbg=NONE ctermfg=green
highlight SignifySignDelete cterm=bold ctermbg=NONE ctermfg=red
highlight SignifySignChange cterm=bold ctermbg=NONE ctermfg=yellow
