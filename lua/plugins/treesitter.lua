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
      opt.foldmethod = "expr"
      opt.foldexpr = "nvim_treesitter#foldexpr()"
      opt.foldenable = false
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
}
