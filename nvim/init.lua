require("options")
require("mappings")
require("tools")
require("pluginslist")

require("plugins.autopairs")
require("plugins.blankline")
require("plugins.bufferline")
require("plugins.cmp")
require("plugins.comment")
require("plugins.dashboard")
require("plugins.gitsigns")
require("plugins.lspconfig")
require("plugins.luasnip")
require("plugins.neoscroll")
require("plugins.nvimtree")
require("plugins.presence")
require("plugins.statusline")
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.vimtex")
require("plugins.zenmode")

--require("plugins.comment-numtostr")
--require("plugins.neogit")

vim.g.gruvbox_material_background = "soft"
vim.g.gruvbox_material_visual = "reverse"
vim.g.gruvbox_material_transparent_background = 1
vim.cmd('colorscheme gruvbox-material')
