call plug#begin('~/.config/nvim/autoload/plugged')

      Plug 'sheerun/vim-polyglot'                           " Better syntax support
      Plug 'scrooloose/NERDTree'                            " File explorer
      Plug 'jiangmiao/auto-pairs'                           " Auto brackets
      Plug 'tpope/vim-surround'                             " Improved brackets
      Plug 'sakhnik/nvim-gdb'                               " Debugger integration
      Plug 'mhinz/vim-startify'                             " Login screen
      Plug 'tpope/vim-commentary'                           " Improved commenting
      Plug 'mg979/vim-visual-multi', {'branch': 'master'}   " Multicursor
      Plug 'neoclide/coc.nvim', {'branch': 'release'}       " Conqueror of Completion
      Plug 'vim-airline/vim-airline'                        " Status bar
      Plug 'vim-airline/vim-airline-themes'                 " Status bar themes
      Plug 'mhinz/vim-signify'                              " Git integration
      Plug 'tpope/vim-fugitive'                             " Git integration
      Plug 'tpope/vim-rhubarb'                              " Git integration
      Plug 'junegunn/gv.vim'                                " Git integration
      Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}       " Ranger integration
      Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }   " FZF integration
      Plug 'junegunn/fzf.vim'                               " FZF integration
      Plug 'justinmk/vim-sneak'                             " Sneak
      Plug 'edkolev/tmuxline.vim'                           " tmux integration
      Plug 'christoomey/vim-tmux-navigator'                 " Properly navigate splits when in tmux
      Plug 'beyondmarc/glsl.vim'                            " glsl syntax highlighting
      Plug 'bfrg/vim-cpp-modern'                            " enhanced C/C++ syntax highlighting
      Plug 'rhysd/vim-grammarous'                           " spell checking
      Plug 'stsewd/sphinx.nvim', { 'do': ':UpdateRemotePlugins' } " Sphinx integration
      Plug 'gu-fan/riv.vim'                                 " rST integration

      Plug 'morhetz/gruvbox'                                " Gruvbox colorscheme
      Plug 'Mizux/vim-colorschemes'                         " blade_runner colorscheme
      Plug 'abnt713/vim-hashpunk'                           " hashpunk colorscheme
call plug#end()
