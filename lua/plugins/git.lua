return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require('gitsigns').setup {
				attach_to_untracked = true,
				current_line_blame = true,
				current_line_blame_opts = {
					delay = 700,
					ignore_whitespace = true,
				},
				sign_priority = 100,
			}
			vim.keymap.set('n', '<leader>gb',
				"<cmd>Gitsigns blame_line<CR>",
				{}
			)
			vim.keymap.set('n', '<leader>gn',
				"<cmd>Gitsigns nav_hunk next<CR>",
				{}
			)
			vim.keymap.set('n', '<leader>gN',
				"<cmd>Gitsigns nav_hunk prev<CR>",
				{}
			)
			vim.keymap.set('n', '<leader>gu',
				"<cmd>Gitsigns reset_hunk<CR>",
				{}
			)
			vim.keymap.set('n', '<leader>gs',
				"<cmd>Gitsigns stage_hunk<CR>",
				{}
			)
			vim.keymap.set('n', '<leader>gd',
				"<cmd>Gitsigns preview_hunk_inline<CR>",
				{}
			)
		end
	},
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
		}
	},
	-- {
	-- 	"NeogitOrg/neogit",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim", -- required
	-- 		"sindrets/diffview.nvim", -- optional - Diff integration
	--
	-- 		-- Only one of these is needed.
	-- 		"nvim-telescope/telescope.nvim", -- optional
	-- 	},
	-- 	cmd = Neogit,
	-- 	config = function()
	-- 		local neogit = require('neogit')
	--      vim.api.nvim_set_hl(0, "NeogitGraphBlack", { fg = "", bold = false})
	--
	-- 		neogit.setup {
	-- 			graph_style = "unicode",
	-- 			disable_line_numbers = false,
	-- 			disable_relative_line_numbers = false,
	-- 		}
	--
	-- 		vim.keymap.set('n', '<leader>gg',
	-- 			-- "<cmd>lua require'neogit'.open({ kind = 'vsplit' })<cr>",
	--        function ()
	--          neogit.open({ kind = "vsplit" })
	--          vim.cmd([[setlocal wrap]])
	--        end,
	-- 			{}
	-- 		)
	-- 		-- vim.keymap.set('n', '<leader>gl',
	-- 		-- 	"<cmd>Neogit log<CR>",
	-- 		-- 	{}
	-- 		-- )
	-- 		vim.keymap.set('n', '<leader>gb',
	-- 			"<cmd>Neogit branch<CR>",
	-- 			{}
	-- 		)
	-- 		vim.keymap.set('n', '<leader>gp',
	-- 			"<cmd>!git pull origin<CR>",
	-- 			{}
	-- 		)
	-- 		vim.keymap.set('n', '<leader>gP',
	-- 			"<cmd>!git push origin<CR>",
	-- 			{}
	-- 		)
	-- 		vim.keymap.set('n', '<leader>gs',
	-- 			"<cmd>!git stash<CR>",
	-- 			{}
	-- 		)
	-- 		vim.keymap.set('n', '<leader>gS',
	-- 			"<cmd>!git apply<CR>",
	-- 			{}
	-- 		)
	-- 	end
	-- },
	{
		'isakbm/gitgraph.nvim',
		opts = {
			git_cmd = "git",
			symbols = {
				merge_commit = 'M',
				commit = '*',
			},
			format = {
				timestamp = '%H:%M:%S %d-%m-%Y',
				fields = { 'hash', 'timestamp', 'author', 'branch_name', 'tag' },
			},
			hooks = {
				-- Check diff of a commit
				on_select_commit = function(commit)
					vim.notify('DiffviewOpen ' .. commit.hash .. '^!')
					vim.cmd(':DiffviewOpen ' .. commit.hash .. '^!')
				end,
				-- Check diff from commit a -> commit b
				on_select_range_commit = function(from, to)
					vim.notify('DiffviewOpen ' .. from.hash .. '~1..' .. to.hash)
					vim.cmd(':DiffviewOpen ' .. from.hash .. '~1..' .. to.hash)
				end,
			},
		},
		keys = {
			{
				"<leader>gl",
				function()
					require('gitgraph').draw({}, { all = true, max_count = 5000 })
				end,
				desc = "GitGraph - Draw",
			},
		},
	},
}
