let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : 'build',
    \ 'options' : [
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \ }
let g:vimtex_toc_config = {
    \ 'name' : 'TOC',
    \ 'layers' : ['content', 'todo', 'include'],
    \ 'resize' : 1,
    \ 'split_width' : 50,
    \ 'todo_sorted' : 0,
    \ 'show_help' : 1,
    \ 'show_numbers' : 1,
    \ 'mode' : 2,
    \ }
let g:tex_flavor = "latex"

autocmd BufNewFile,BufRead *.cls set syntax=tex

"    \   '-xelatex',
