require('pluginlist')
require('options')
require('mappings')

require('plugins.autopairs')
require('plugins.blankline')
require('plugins.bufferline')

require('plugins.colorizer')
require('plugins.comment')
require('plugins.compe')
require('plugins.dashboard')

require('plugins.lspconfig')
require('plugins.lspkind')
require('plugins.lspsignature')
require('plugins.luasnip')

require('plugins.statusline')
require('plugins.neoscroll')
require('plugins.nvimtree')

require('plugins.toggleterm')
require('plugins.treesitter')
require('plugins.vimtex')
require('plugins.zenmode')

vim.g.gruvbox_material_background = "soft"
vim.g.gruvbox_material_visual = "reverse"
vim.g.gruvbox_material_transparent_background = 1
vim.cmd('colorscheme gruvbox-material')
