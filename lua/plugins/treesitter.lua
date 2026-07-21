return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local tsconfig = require("nvim-treesitter.configs")
			tsconfig.setup({
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"python",
					"javascript",
					"query",
					"markdown",
					"css",
					"dockerfile",
					"editorconfig",
					"gitignore",
					"html",
					"javadoc",
					"json",
					"nginx",
					"php",
					"regex",
					"yaml",
				},
				sync_install = false,
				highlight = { enable = true },
        indent = { enable = true },
			})

      local opt = vim.opt
			opt.foldmethod = "manual"
      -- opt.foldmethod = "expr"
      -- opt.foldexpr = "nvim_treesitter#foldexpr()"
		end,
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		config = function()
      vim.cmd("highlight RDYellow guifg=#FAD617")
      vim.cmd("highlight RDViolet guifg=#D173CB")
      vim.cmd("highlight RDBlue guifg=#38A1FE")
			vim.g.rainbow_delimiters = {
				highlight = {
					"RDYellow",
					"RDViolet",
					"RDBlue",
				},
			}
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		config = function ()
			require('nvim-ts-autotag').setup({

			})
		end
	},
	-- {
	--    'MeanderingProgrammer/render-markdown.nvim',
	--    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
	--    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
	--    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
	--    ---@module 'render-markdown'
	--    ---@type render.md.UserConfig
	--    opts = {},
	--  }
}
