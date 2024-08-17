-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
	-- Packer can manage itself
	use('wbthomason/packer.nvim')

	use({
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	})

	use({
		'Mofiqul/dracula.nvim',
		as = 'dracula',
		config = function()
--			vim.cmd('colorscheme dracula')
		end
	})

    use({
        'catppuccin/nvim',
        as = 'catppuccin',
        config = function()
            vim.cmd('colorscheme catppuccin')
        end
    })

	use({
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	})

	use('ThePrimeagen/harpoon')
	use('mbbill/undotree')
	use('tpope/vim-fugitive')

    use({
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
            'williamboman/mason.nvim',
            run = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
        }

    })

    use({
        "jackMort/ChatGPT.nvim",
        config = function()
            require("chatgpt").setup({
                api_host_cmd = 'echo -n ""',
                api_key_cmd = 'echo -n""',
                api_type_cmd = 'echo azure',
                azure_api_base_cmd = 'echo -n ""',
                azure_api_engine_cmd = 'echo -n ""',
                azure_api_version_cmd = 'echo -n ""',
                openai_params = {
                    model = 'gpt-4-1106-Preview'
                }
            })
        end,
        requires = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "folke/trouble.nvim",
            "nvim-telescope/telescope.nvim"
        }
    })

    use('vimwiki/vimwiki')

end)

