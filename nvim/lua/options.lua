local opt = vim.opt
local g = vim.g

opt.undofile = true
opt.ruler = false
opt.hidden = true
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.cul = true
opt.mouse = "a"
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.updatetime = 250
opt.timeoutlen = 400
opt.clipboard = "unnamedplus"
opt.hlsearch = false
opt.cursorline = false

-- Incremental live completion
opt.inccommand = 'nosplit'

-- Display long lines as few
opt.wrap = true
opt.linebreak = true

-- Disable nvim intro
opt.shortmess:append("sl")

-- Disable tilde on end of buffer
opt.fillchars = {eob = " "}

-- Save undo history
vim.cmd [[set undofile]]

-- Case insensitive searching UNLESS /C or capital in search
opt.ignorecase = true
opt.smartcase = true

-- Numbers
opt.number = true
opt.numberwidth = 4
opt.relativenumber = true

-- Tab
opt.tabstop = 4
opt.smarttab = true

-- Indentline
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true

-- Go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>hl")

g.mapleader = " "
g.auto_save = false

-- Disable builtin vim plugins
local disabled_built_ins = {
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"spellfile_plugin",
	"matchit"
}
for _, plugin in pairs(disabled_built_ins) do
	g["loaded_" .. plugin] = 1
end

-- Highlight on yank
vim.api.nvim_exec(
	[[
	augroup YankHighlight
		autocmd!
		autocmd TextYankPost * silent! lua vim.highlight.on_yank()
	augroup end
	]], false
)
