return {
	"m4xshen/autoclose.nvim",
	config = function()
		local ignoredTypes = { ["markdown"] = 1 }
		require("autoclose").setup({
			keys = {
				-- ["<"] = { escape = false, close = true, pair = "<>" },
				["'"] = { escape = false, close = ignoredTypes[vim.bo.filetype] == nil, pair = "''"},
				["*"] = { escape = false, close = ignoredTypes[vim.bo.filetype] ~= nil, pair = "**" }
			},
      options = {
        disable_when_touch = true,
        pair_spaces = true,
      }
		})
	end,
}
