local opt = vim.opt
local g = vim.g

g.vimtex_compiler_latexmk = {
    build_dir = 'build',
    options = {
        '-file-line-error',
        '-synctex=1',
        '-interaction=nonstopmode'
    }
}

g.tex_flavor = 'latex'
g.vimtex_fold_manual = 1
g.vimtex_latexmk_continuous = 1
