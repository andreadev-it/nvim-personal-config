vim.cmd [[packadd packer.nvim]]

local packer = require('packer')

packer.init {
    display = {
        open_fn = function()
            return require('packer.util').float { border = "rounded" }
        end,
    },
}

-- INDENTLINE config
local indentlineConfig = function()
    vim.g.indentLine_char = '▏'
end

-- LUALINE config
local lualineConfig = function()
    require('lualine').setup({
        options = {
            globalstatus = true
        }
    })
end

-- AUTOPAIRS config
local autoPairsConfig = function()
    require("nvim-autopairs").setup()
end

-- GITSIGNS config
local gitsignsConfig = function()
    require("gitsigns").setup()
end

-- COMMENT.NVIM config
local commentConfig = function()
    require('Comment').setup()
end



-- COPILOT config
 local copilotConfig = function()
    vim.g.copilot_no_tab_map = true
    vim.g.copilot_assume_mapped = true
    vim.g.copilot_tab_fallback = ""

    vim.cmd[[
    let g:copilot_filetypes = {
        \ '*': v:false,
        \ 'python': v:true,
        \ 'javascript': v:true,
        \ 'typescript': v:true,
        \ 'php': v:true
        \ }
    ]]
 end


-- NEOTREE Config
local neoTreeConfig = function()
    -- Unless you are still migrating, remove the deprecated commands from v1.x
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

    -- If you want icons for diagnostic errors, you'll need to define them somewhere:
    vim.fn.sign_define("DiagnosticSignError",
        {text = " ", texthl = "DiagnosticSignError"})
    vim.fn.sign_define("DiagnosticSignWarn",
        {text = " ", texthl = "DiagnosticSignWarn"})
    vim.fn.sign_define("DiagnosticSignInfo",
        {text = " ", texthl = "DiagnosticSignInfo"})
    vim.fn.sign_define("DiagnosticSignHint",
        {text = "", texthl = "DiagnosticSignHint"})
    -- NOTE: this is changed from v1.x, which used the old style of highlight groups
    -- in the form "LspDiagnosticsSignWarning"

    require("neo-tree").setup({
        window = {
            position = "left",
            width = 30,
        },
        filesystem = {
            filtered_items = {
                hide_dotfiles = false
            },
        },
        event_handlers = {
            {
                event = "neo_tree_buffer_enter",
                handler = function()
                    -- Remove sidescroll and indenting lines when inside NeoTree window
                    vim.opt_local.sidescrolloff = 0
                    vim.cmd(":IndentLinesDisable")
                end,
            }
        }
    })
end

-- TOGGLETERM config
local toggletermConfig = function()
    require("toggleterm").setup({
        open_mapping = [[<leader>t]],
        insert_mappings = false,
        direction =  "float"
    })
end

-- SHADE config
local shadeConfig = function()
    require("shade").setup({
        exclude_filetypes = {"neo-tree"}
    })
end



return packer.startup(function(use)
	-- Packer itself
	use 'wbthomason/packer.nvim'

    -- Appearance
    use 'kyazdani42/nvim-web-devicons'
    use 'EdenEast/nightfox.nvim'
    use 'ellisonleao/gruvbox.nvim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = lualineConfig
    }
    use {
        'Yggdroot/indentLine',
        config = indentlineConfig
    }
    use {
        'p00f/nvim-ts-rainbow',
        requires = { 'nvim-treesitter/nvim-treesitter' }
    }
    use {
        '/home/andrea/Projects/Shade.nvim',
        config = shadeConfig
    }

	-- Completion
    use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-path'
    use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/cmp-cmdline'

    use 'L3MON4D3/LuaSnip'
    use 'hrsh7th/cmp-nvim-lsp'
    use {
        'github/copilot.vim',
        config = copilotConfig
    }

	-- LSP
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'

    -- GIT
    use {
        'lewis6991/gitsigns.nvim',
        config = gitsignsConfig
    }

    -- Functionalities
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim"
        },
        config = neoTreeConfig
    }
    use {
        "windwp/nvim-autopairs",
        config = autoPairsConfig,
    }
    use {
        'numToStr/Comment.nvim',
        config = commentConfig
    }
    use {
        "akinsho/toggleterm.nvim",
        config = toggletermConfig
    }

end)
