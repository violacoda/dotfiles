local M = {}
local cmd = vim.cmd

local function map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {}

-- Don't copy the replaced text after pasting in visual mode
map("v", "p", '"_dP', opt)

-- Remap space as leader key
map('', '<Space>', '<Nop>')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Remap for dealing with word wrap
map("", "j", 'v:count ? "j" : "gj"', {expr = true})
map("", "k", 'v:count ? "k" : "gk"', {expr = true})
map("", "<Down>", 'v:count ? "j" : "gj"', {expr = true})
map("", "<Up>", 'v:count ? "k" : "gk"', {expr = true})

-- Copy whole file content
map("n", "<C-a>", ":%y+<CR>", opt)

-- Resize windows: alt + hjkl
map("n", "<M-j>", ":resize -1<CR>", opt)
map("n", "<M-k>", ":resize +1<CR>", opt)
map("n", "<M-h>", ":vertical resize -1<CR>", opt)
map("n", "<M-l>", ":vertical resize +1<CR>", opt)

-- Window navigation: ctrl + hjkl
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)
map("n", "<C-l>", "<C-w>l", opt)

-- Open a new buffer as a Terminal
-- Get out of terminal with jk
map("t", "jk", "<C-\\><C-n>", opt)

--M.toggleterm = function()
--    -- Open terminals
--    map("n", "<leader>w", ":execute v:count . 'ToggleTerm direction=window' <CR>", opt)
--    map("n", "<leader>v", ":execute v:count . 'ToggleTerm direction=vertical' <CR>", opt)
--    map("n", "<leader>h", ":execute v:count . 'ToggleTerm direction=horizontal' <CR>", opt)
--
--    -- 'Un' toggle a term from within terminal edit mode
--    map("t", "<leader>w", "<C-\\><C-n> :ToggleTerm <CR>", opt)
--    map("t", "<leader>v", "<C-\\><C-n> :ToggleTerm <CR>", opt)
--    map("t", "<leader>h", "<C-\\><C-n> :ToggleTerm <CR>", opt)
--end

M.truezen = function()
    map("n", "<leader>zz", ":TZAtaraxis<CR>", opt)
    map("n", "<leader>zm", ":TZMinimalist<CR>", opt)
    map("n", "<leader>zf", ":TZFocus<CR>", opt)
end

map("n", "<C-s>", ":w <CR>", opt)

M.nvimtree = function()
    map("n", "<C-n>", ":NvimTreeToggle<CR>", opt)
end

M.dashboard = function()
    map("n", "<leader>db", "Dashboard<CR>", opt)
    map("n", "<leader>fn", "DashboardNewFile<CR>", opt)
    map("n", "<leader>bm", "DashboardJumpMarks<CR>", opt)
    map("n", "<leader>l", "SessionLoad<CR>", opt)
    map("n", "<leader>s", "SessionSave<CR>", opt)
end

M.telescope = function()
    map("n", "<leader>fw", ":Telescope live_grep<CR>", opt)
    map("n", "<leader>gt", ":Telescope git_status<CR>", opt)
    map("n", "<leader>cm", ":Telescope git_commits<CR>", opt)
    map("n", "<leader>ff", ":Telescope find_files<CR>", opt)
    map("n", "<leader>fp", ":Telescope media_files<CR>", opt)
    map("n", "<leader>fb", ":Telescope buffers<CR>", opt)
    map("n", "<leader>fh", ":Telescope help_tags<CR>", opt)
    map("n", "<leader>fo", ":Telescope oldfiles<CR>", opt)
    map("n", "<leader>th", ":Telescope themes<CR>", opt)
end

M.bufferline = function()
    map("n", "<S-t>", ":enew<CR>", opt)     -- New Buffer
    map("n", "<C-t>b", ":tabnew<CR>", opt)  -- New Tab
    map("n", "<S-x>", ":bd!<CR>", opt)      -- Close Buffer

    -- Move betweeen tabs
    map("n", "<TAB>", ":BufferLineCycleNext<CR>", opt)
    map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opt)
end

-- Use ESC to turn off search highlighting
map("n", "<Esc>", ":noh<CR>", opt)

M.fugitive = function()
    map("n", "<leader>gs", ":Git<CR>", opt)
    map("n", "<leader>gh", ":diffget //2<CR>", opt)
    map("n", "<leader>gl", ":diffget //3<CR>", opt)
    map("n", "<leader>gb", ":Git blame<CR>", opt)
end

M.gitsigns = function()
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
        end, {expr=true})

        map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
        end, {expr=true})

        -- Actions
        map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
        map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
        map('n', '<leader>hS', gs.stage_buffer)
        map('n', '<leader>hu', gs.undo_stage_hunk)
        map('n', '<leader>hR', gs.reset_buffer)
        map('n', '<leader>hp', gs.preview_hunk)
        map('n', '<leader>hb', function() gs.blame_line{full=true} end)
        map('n', '<leader>tb', gs.toggle_current_line_blame)
        map('n', '<leader>hd', gs.diffthis)
        map('n', '<leader>hD', function() gs.diffthis('~') end)
        map('n', '<leader>td', gs.toggle_deleted)

        -- Text object
        map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end
end

return M
