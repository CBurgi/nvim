return {
	"mason-org/mason-lspconfig.nvim",
	lazy = false,
	opts = {},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls@3.15.0",
				-- "clangd",
				"vimls",
				"eslint",
				"ts_ls",
				-- "intelephense",
				-- "phpactor",
				-- "sqlls",
				"pylsp",
				"cssls",
				"html",
				"jsonls",
			},
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = require("cmp_nvim_lsp").default_capabilities(),
					})
				end,
			},
		})
		require('render-markdown').setup({
			completions = { lsp = { enabled = true } },
		})
		-- require("lspconfig")['intelephense'].setup({
		-- 	settings = {
		-- 		intelephense = {
		-- 			format = {
		-- 				enable = true,
		-- 				braces = 'allman',
		-- 			},
		-- 		},
		-- 	},
		-- })
		-- Use LspAttach autocommand to only map the following keys
		-- after the language server attaches to the current buffer
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-0>
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				-- Buffer local mappings.
				-- See `:help vim. lsp .* ' for documentation on any of the below functions
				local opts = { remap=false, buffer = ev.buf }
				vim.keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "<leader>lt", vim.lsp.buf.type_definition, opts)
				vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float, opts)
				vim.keymap.set("n", "<leader>ln", function()
					vim.diagnostic.jump({ wrap = true, float = true, count = 1 })
				end, opts)
				vim.keymap.set("n", "<leader>lN", function()
					vim.diagnostic.jump({ wrap = true, float = true, count = -1 })
				end, opts)
				vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
				-- vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
				vim.keymap.set("n", "<leader>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<leader>F", function()
					vim.lsp.buf.format({ async = true })
				end, opts)
			end,
		})
		-- Autocommands
		local cmdStates = { ["cursorHold"] = true, ["autoSave"] = true }
		local cmdOpts = { ["toggle"] = 1, ["true"] = 1, ["false"] = 1 }
		local stb = { ["true"] = true, ["false"] = false }

		-- local function toggleCmd(cmd, opt)
		-- 	cmdStates[cmd] = opt == "toggle" and not cmdStates[cmd] or stb[opt]
		-- end
		-- vim.api.nvim_create_user_command("SetCmd", function(opts)
		-- 	local args = opts.fargs
		--
		-- 	if cmdStates[args[1]] == nil then
		-- 		print(args[1], "not a valid cmd.")
		-- 		return
		-- 	end
		-- 	if #args == 2 and cmdOpts[args[2]] == nil then
		-- 		print(args[2], "not a valid option.")
		-- 		return
		-- 	end
		--
		-- 	local cmd = args[1]
		-- 	local opt = #args == 2 and args[2] or "toggle"
		-- 	toggleCmd(cmd, opt)
		-- end, {
		-- 	nargs = "+",
		-- 	desc = "Set cmd to opt",
		-- })

		if cmdStates["cursorHold"] == true then
			local ignoredTypes = { ["markdown"] = 1 }
			vim.cmd("set updatetime=4000")
			vim.api.nvim_create_autocmd({ "CursorHoldI" }, {
				callback = function(ev)
					if ignoredTypes[vim.bo.filetype] == nil then
						vim.lsp.buf.hover({ buffer = ev.buf })
					end
				end,
			})
		end
		if cmdStates["autoSave"] == true then
			local ignoredTypes = { ["lua"] = 1, ["vim"] = 1 }
			vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
				callback = function(ev)
					if ignoredTypes[vim.bo.filetype] == nil then
						vim.cmd("silent! update")
					end
				end,
			})
		end
	end,
}
