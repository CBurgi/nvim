return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
    "nvim-neo-tree/example-source",
	},
	lazy = false,
	config = function()
		local ntconfig = require("neo-tree")
		ntconfig.setup({
			source_selector = {
        winbar = true,
        sources = {
          { source = "filesystem", display_name = " 󰉓 Files "},
          { source = "buffers", display_name = " 󰈚 Buffers "},
          -- { source = "example", display_name = " 󰊢 Git "},
          { source = "git_status", display_name = " 󰊢 Git "},
        }
      },
      -- sources = { "filesystem", "buffers", "example" },
      sources = { "filesystem", "buffers", "git_status" },
      example = {

      },
      window = {
        width = 30
      },
			enable_diagnostics = false,
			filesystem = {
				filtered_items = {
					visible = true,
				},
			},
			event_handlers = {
				{
					event = "file_open_requested",
					handler = function()
						require("neo-tree.command").execute({ action = "close" })
					end,
				},
				{
					event = "neo_tree_buffer_enter",
					handler = function(arg)
            -- vim.api.nvim_win_set_width(0, 30)
						vim.cmd([[setlocal relativenumber]])
					end,
				},
      }
		})
		vim.keymap.set("n", "<leader>n", ":Neotree filesystem toggle reveal left<CR>", {})
	end,
}
