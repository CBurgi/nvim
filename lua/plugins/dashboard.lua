return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			-- config
			disable_move = true,
			project = {
				enable = true,
				limit = 8,
				icon = "your icon",
				label = "",
				-- action = function (path)
				--       vim.cmd("<cmd>lua require'telescope.builtin'.oldfiles({ cwd = " .. path .. " })<cr>")
				-- end,
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
