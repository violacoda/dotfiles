---- Automatically install packer.nvim at bootstrapping
local pack_path = "/site/pack/packer/opt/packer.nvim"
local install_path = vim.fn.stdpath("data") .. pack_path
local packer_repo = "https://github.com/wbthomason/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.cmd(table.concat({ "!git clone", packer_repo, install_path }, " "))
end

-- Only required if you have packer in your `opt` pack
vim.cmd([[packadd packer.nvim]])

vim.cmd([[ autocmd BufWritePost pluginlist.lua PackerCompile ]])

local packer = require("packer")
packer.startup({
function()
    local use = packer.use

    -- Packer can manage itself as an optional plugin
    use { "wbthomason/packer.nvim", opt = true }

    use "kyazdani42/nvim-web-devicons"
    use "akinsho/nvim-bufferline.lua"
    use { "hoob3rt/lualine.nvim", config = function() require "plugins.statusline" end }
    use { "kyazdani42/nvim-tree.lua", config = function() require "plugins.nvimtree" end }
    use { "hrsh7th/nvim-compe", 
        config = function() require "plugins.compe" end,
        requires = { 
            {"L3MON4D3/LuaSnip", config = function() require "plugins.luasnip" end }, 
            { "rafamadriz/friendly-snippets" } 
        } 
    }
    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim"
    use { "nvim-telescope/telescope.nvim",
    	requires = { 
            { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }, 
            { "nvim-telescope/telescope-media-files.nvim" }   
	    }
    }
    use "glepnir/dashboard-nvim"
    use "akinsho/nvim-toggleterm.lua"
    use "andymass/vim-matchup"
    use "windwp/nvim-autopairs"
    use "terrortylor/nvim-comment"

    use { "Pocco81/TrueZen.nvim", 
        config = function() require "plugins.zenmode" end,
        setup = function() require "mappings".truezen() end 
    }
    use "lukas-reineke/indent-blankline.nvim"
    use "norcalli/nvim-colorizer.lua"
    use "karb94/neoscroll.nvim"
    use "folke/which-key.nvim" 

    use "nvim-treesitter/nvim-treesitter"
    use "kabouzeid/nvim-lspinstall"
    use { "neovim/nvim-lspconfig", config = function() require "plugins.lspconfig" end }
    use "onsails/lspkind-nvim"
    use "ray-x/lsp_signature.nvim"

    use "airblade/vim-gitgutter"
    use "tpope/vim-fugitive"
    use "tpope/vim-rhubarb"
    use "junegunn/gv.vim"

    use "beyondmarc/glsl.vim"
    use "lervag/vimtex"

    use "sainnhe/everforest"
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
