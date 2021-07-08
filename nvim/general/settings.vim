" set leader key
let g:mapleader = "\<Space>"

syntax enable			" Enables syntax highlighting
set hidden				" Required to keep multiple buffers open
set wrap				" Display long lines as just one line
set linebreak			" Avoid wrapping a line in the middle of a word
set encoding=utf-8		" The encoding displayed
set fileencoding=utf-8		" The encoding written to file
set pumheight=10			" Makes popup menu smaller
set ruler				" Show the cursor position all the time
set mouse=a				" Enables the mouse
set cmdheight=2			" More space for displaying messages
set iskeyword+=-			" Treat dash seperated words as a word text object
set splitbelow			" Horizontal splits will automatically be below
set splitright			" Vertical splits will automatically be to the right
set t_Co=256			" Support 256 colors
set conceallevel=0		" To see `` in markdown files
set tabstop=4			" Insert 4 spaces for a tab
set smarttab			" Smarter tabbing
set expandtab			" Converts tab to spaces
set shiftwidth=4			" Change the number of space characters inserted for indentation
set smartindent			" Smarter indenting
set autoindent			" Good auto indent
set laststatus=0			" Always display the status line
set title				" Set the window's title, reflecting the file currently being edited
set wildmenu			" Display command line's tab complete options as a menu
set number				" Line numbers
set cursorline			" Enables highlighting of the current line
set background=dark		" Tell vim what the background color looks like
set showtabline=2			" Always show tabs
set noshowmode			" Modes like -- INSERT -- replaced with airline
set nobackup			" Recommended by coc
set nowritebackup			" Recommended by coc
set updatetime=300		" Faster completion
set timeoutlen=500		" Default is: 1000
set formatoptions=jql		" Stop newline continuation of comments
set clipboard=unnamedplus	" Copy paste between vim and everything else
set history=1000			" Increase the undo limit
set visualbell			" Blink cursor on error instead of beeping
set shortmess+=c              " Dont pass messages to ins completion-menu
set mouse=r
set exrc
set secure

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

au! BufWritePost $MYVIMRC source % 	" Auto source when writing

" Write with sudo
cmap w!! w !sudo tee %
