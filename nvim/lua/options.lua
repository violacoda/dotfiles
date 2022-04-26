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
opt.cmdheight = 2
opt.updatetime = 250
opt.timeoutlen = 400

opt.clipboard = "unnamedplus"
opt.hlsearch = false
opt.cursorline = false
opt.showmode = false
opt.inccommand = "nosplit"
opt.wrap = true
opt.linebreak = true

opt.ignorecase = true
opt.smartcase = true
opt.tabstop = 4
opt.smarttab = true
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true

opt.number = true
opt.numberwidth = 4
opt.relativenumber = true

opt.whichwrap:append("<>hl")    -- Previous/next line when cursor reaches end or beginning of line
opt.shortmess:append("sl") 	-- Disable nvim intro
opt.fillchars = {eob = " "} 	-- Disable ~ on end of buffer

vim.cmd [[set undofile]]

g.mapleader = " "
g.auto_save = false

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

vim.api.nvim_exec(
	[[
	augroup YankHighlight
		autocmd!
		autocmd TextYankPost * silent! lua vim.highlight.on_yank()
	augroup end
	]], false
)


