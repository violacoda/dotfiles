-- Automatically install packer.nvim at bootstrapping
local pack_path = "/site/pack/packer/opt/packer.nvim"
local install_path = vim.fn.stdpath("data") .. pack_path
local packer_repo = "https://github.com/wbthomason/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.cmd(table.concat({ "!git clone", packer_repo, install_path }, " "))
end

-- Only required if you have packer in your `opt` pack
vim.cmd([[packadd packer.nvim]])

-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand
vim.cmd([[ autocmd BufWritePost plugins.lua PackerCompile ]])

local packer = require("packer")
packer.startup({
  function()
    local use = packer.use

    -- Packer can manage itself as an optional plugin
    use { "wbthomason/packer.nvim", opt = true }

    use { "mg979/vim-visual-multi", branch = "master" }  	-- Multi-cursor visual mode
    use "jiangmiao/auto-pairs" 			-- Auto-paired brackets
    use	"tpope/vim-surround" 			-- Improved brackets
    use "tpope/vim-commentary"  		-- Comment out blocks or lines
    --use "ludovicchabant/vim-gutentags" 		-- Automatic tags management
    use "norcalli/nvim-colorizer.lua"	 	-- Color highlighter

    use "beyondmarc/glsl.vim" 			-- GLSL syntax highlighting
    use "lervag/vimtex" 			-- LaTeX integration

    use "folke/which-key.nvim"  		-- Popup display for keybindings
    use "kyazdani42/nvim-tree.lua"  		-- File tree explorer
    use "lukas-reineke/indent-blankline.nvim"   -- Line indenting
    --use "glepnir/dashboard-nvim" 		-- Startup Dashboard
    use "nvim-treesitter/nvim-treesitter"  	-- Treesitter parsing

    -- Fuzzy finder
    use { "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } } }
    -- Buffer Line
    use { "akinsho/nvim-bufferline.lua", requires = "kyazdani42/nvim-web-devicons" }
    -- Status Line
    use { "hoob3rt/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } }

    --< Git >--
    -- Git diff with sign columns
    use { "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } }  
    use "tpope/vim-fugitive"  			-- Git wrapper
    use "tpope/vim-rhubarb"  			-- GitHub extension for fugitive
    use "junegunn/gv.vim"  			-- Git Commit Browser

    --< Colorschemes >--
    use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}		-- Gruvbox

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
