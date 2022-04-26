local pack_path = "/site/pack/packer/opt/packer.nvim"
local install_path = vim.fn.stdpath("data") .. pack_path
local packer_repo = "https://github.com/wbthomason/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.cmd(table.concat({ "!git clone", packer_repo, install_path }, " "))
end

vim.cmd([[packadd packer.nvim]])
vim.cmd([[ autocmd BufWritePost pluginslist.lua PackerCompile ]])

local packer = require("packer")
packer.startup({
    function()
	    local use = packer.use

	    use { "wbthomason/packer.nvim", opt = true }

	    use "kyazdani42/nvim-web-devicons"
        use "nvim-lua/plenary.nvim"
        use "nvim-lua/popup.nvim"

        use "akinsho/nvim-bufferline.lua"
        use { "hoob3rt/lualine.nvim", config = function() require "plugins.statusline" end }
        use { "kyazdani42/nvim-tree.lua", config = function() require "plugins.nvimtree" end }
        use { "mbbill/undotree", cmd = "UndoTreeToggle", config = [[vim.g.undotree_SetFocusWhenToggle = 1]] }

        use "glepnir/dashboard-nvim"
        use "andymass/vim-matchup"
        use "terrortylor/nvim-comment"
        use "lukas-reineke/indent-blankline.nvim"
        use "folke/which-key.nvim"
        use "lambdalisue/suda.vim"
        use "farmergreg/vim-lastplace"
        
        use "karb94/neoscroll.nvim"
        use "RRethy/vim-illuminate"
        use "ggandor/lightspeed.nvim"
        use "tpope/vim-surround"
        use "windwp/nvim-autopairs"

        use { "Pocco81/TrueZen.nvim",
            config = function() require "plugins.zenmode" end,
            setup = function() require "mappings".truezen() end
        }

        use { "nvim-telescope/telescope.nvim",
            requires = {
                { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
                { "nvim-telescope/telescope-media-files.nvim" }
            }
        }

        -- add terminal view

        use "nvim-treesitter/nvim-treesitter"
        --use { "numToStr/Comment.nvim", config = function() require "plugins.comment-numtostr" end }

        use { "neovim/nvim-lspconfig", config = function() require "plugins.lspconfig" end }
        use "williamboman/nvim-lsp-installer"
        use "jose-elias-alvarez/null-ls.nvim"
        use "folke/trouble.nvim"
        use "j-hui/fidget.nvim"

        use "hrsh7th/cmp-nvim-lsp"
        use "hrsh7th/cmp-nvim-lsp-signature-help"
        use "hrsh7th/cmp-nvim-lsp-document-symbol"
        use "hrsh7th/cmp-buffer"
        use "hrsh7th/cmp-path"
        use "hrsh7th/cmp-cmdline"
        use { "hrsh7th/nvim-cmp", config = function() require "plugins.cmp" end }

        use { "L3MON4D3/LuaSnip", config = function() require "plugins.luasnip" end }
        use "hrsh7th/cmp-nvim-lua"
        use "saadparwaiz1/cmp_luasnip"
        use "rafamadriz/friendly-snippets"
        use "lukas-reineke/cmp-under-comparator"

        use { "tpope/vim-fugitive", cmd = { "Git", "Gstatus", "Gblame", "Gpush", "Gpull" }, disable = true }
        use { "lewis6991/gitsigns.nvim", config = function() require "plugins.gitsigns" end }
        use "APZelos/blamer.nvim"
        use "sindrets/diffview.nvim"
        --use { "TimUntersberger/neogit", cmd = "Neogit", config = function() require "plugins.neogit" end }

        use "beyondmarc/glsl.vim"
        use "lervag/vimtex"
        use "p00f/clangd_extensions.nvim"
        use "igankevich/mesonic"
        use "andweeb/presence.nvim"

        use "sainnhe/gruvbox-material"
    end,
    config = {
	    max_jobs = 10,
	    git = { clone_timeout = false },
	    display = {
		    working_sym = "🗘",
		    prompt_border = "rounded",
		    open_fn = function()
			    return require("packer.util").float({ border = "rounded" })
		    end,
	    },
    },
})
