return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "v0.1.9",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = false,
		config = function()
			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<C-s>"] = require("telescope.actions").select_vertical,
						},
					},
          path_display={"smart"},
				},
			})
			local builtin = require("telescope.builtin")
			vim.keymap.set(
				"n",
				"<leader>fa",
				"<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '--no-ignore', '--no-ignore-vcs', '-g', '!.git' }})<cr>",
				{}
			)
			vim.keymap.set(
				"n",
				"<leader>fA",
				"<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '--no-ignore-vcs', '-g', '!.git' }, cwd = '~'})<cr>",
				{}
			)
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fF", "<cmd>lua require'telescope.builtin'.find_files({ cwd = '~' })<cr>", {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							-- even more opts
						}),
					},
				},
				pickers = {
					oldfiles = {
						cwd_only = true,
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
