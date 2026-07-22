vim.g.mapleader = " "
vim.cmd("source ~/.config/nvim/vimrc.vim")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

-- save/load sessions
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
-- vim.api.nvim_create_autocmd("VimEnter", {
--   callback = function ()
--
--   end
-- })
--

-- Find/replace in file
vim.keymap.set(
	"n",
	"rec",
	":%s/class=/className=<cr>",
	{ remap = false }
)
vim.keymap.set(
	"n",
	"<leader>hw",
	"\"ayiw:let @b = substitute(@a, '[\\[\\]\\.\\^\\$\\*\\+\\?\\(\\)\\|]', '\\\\\\0', 'g')<cr>:<C-u>%s/<C-R>b//gc<Left><Left><Left>",
	{ remap = false, desc = "File Search & Replace word" }
)
vim.keymap.set(
	"n",
	"<leader>hl",
	"\"ayy:let @b = substitute(@a, '[\\[\\]\\.\\^\\$\\*\\+\\?\\(\\)\\|]', '\\\\\\0', 'g')<cr>:<C-u>%s/<C-R>b//gc<Left><Left><Left>",
	{ remap = false, desc = "File Search & Replace line" }
)
vim.keymap.set(
	"v",
	"<leader>h",
	"\"ay:let @b = substitute(@a, '[\\[\\]\\.\\^\\$\\*\\+\\?\\(\\)\\|]', '\\\\\\0', 'g')<cr>:<C-u>%s/<C-R>b//gc<Left><Left><Left>",
	{ remap = false, desc = "File Search & Replace selection" }
)
vim.keymap.set(
	"n",
	"<leader>Hw",
	"\"ayiw:let @b = substitute(@a, '[\\[\\]\\.\\^\\$\\*\\+\\?\\(\\)\\|]', '\\\\\\0', 'g')<cr>:<C-u>%s/<C-R>b/<C-R>a/gc<Left><Left><Left>",
	{ remap = false, desc = "File Search & Replace word with copy" }
)
vim.keymap.set(
	"n",
	"<leader>Hl",
	"\"ayy:let @b = substitute(@a, '[\\[\\]\\.\\^\\$\\*\\+\\?\\(\\)\\|]', '\\\\\\0', 'g')<cr>:<C-u>%s/<C-R>b/<C-R>a/gc<Left><Left><Left>",
	{ remap = false, desc = "File Search & Replace line with copy" }
)
vim.keymap.set(
	"v",
	"<leader>H",
	"\"ay:let @b = substitute(@a, '[\\[\\]\\.\\^\\$\\*\\+\\?\\(\\)\\|]', '\\\\\\0', 'g')<cr>:<C-u>%s/<C-R>b/<C-R>a/gc<Left><Left><Left>",
	{ remap = false, desc = "File Search & Replace selection with copy" }
)
vim.keymap.set(
  "n",
  "<leader>fw",
  "\"ayiw:let @b = substitute(@a, '[\\[\\]\\.\\^\\$\\*\\+\\?\\(\\)\\|]', '\\\\\\0', 'g')<cr>/<C-R>b<cr>",
	{ remap = false, desc = "File Search word" }
)
vim.keymap.set(
  "n",
  "<leader>fl",
  "\"ayy:let @b = substitute(@a, '[\\[\\]\\.\\^\\$\\*\\+\\?\\(\\)\\|]', '\\\\\\0', 'g')<cr>/<C-R>b<cr>",
	{ remap = false, desc = "File Search line" }
)
vim.keymap.set(
  "v",
  "<leader>f",
  "\"ay:let @b = substitute(@a, '[\\[\\]\\.\\^\\$\\*\\+\\?\\(\\)\\|]', '\\\\\\0', 'g')<cr>/<C-R>b<cr>",
	{ remap = false, desc = "File Search selection" }
)
vim.keymap.set(
	"n",
	"<leader>fx",
	":noh<cr>",
	{ remap = false, desc = "noh" }
)

-- Paste from yank
vim.keymap.set(
	"n",
	"<leader>p",
	"\"0p",
	{ remap = false, desc = "Paste from yank register" }
)
vim.keymap.set(
	"n",
	"<leader>P",
	"\"0P",
	{ remap = false, desc = "Paste before from yank register" }
)

-- Insert blank line
vim.keymap.set("n", "<leader>o", "<cmd>put _<cr>", {})
vim.keymap.set("n", "<leader>O", "<cmd>put! _<cr>", {})

-- Split parameters
-- vim.keymap.set("n", "S", function()
  -- local buf = vim.api.nvim_get_current_buf()
  -- local row = vim.api.nvim_win_get_cursor(0)[1]
  -- local orig_line = vim.api.nvim_get_current_line()
  --
  -- -- 1–4: Apply your priority splitting rules
  -- local line = orig_line
  -- line = line:gsub("%(", "(\n")
  -- line = line:gsub(",[ \t]*", ",\n")
  -- line = line:gsub("%)", "\n)")
  --
  -- -- Convert single string → table of lines
  -- local new_lines = {}
  -- for l in line:gmatch("[^\n]+") do
  --   table.insert(new_lines, l)
  -- end
  --
  -- -- Replace current line with new lines
  -- vim.api.nvim_buf_set_lines(buf, row - 1, row, false, new_lines)
  --
  -- -- Apply vim auto-indentation to each inserted line
  -- for i = 1, #new_lines - 2 do
  --   local lnum = row - 1 + i
  --
  --   -- Use Vim's indent() function to calculate desired indentation
  --   local indent = vim.fn.indent(lnum)
  --
  --   -- If indent() returns 0, use fallback indentation logic
  --   if indent == 0 then
  --     indent = vim.bo.shiftwidth > 0 and vim.bo.shiftwidth or 4
  --   end
  --
  --   -- Re-indent the line
  --   local text = vim.api.nvim_buf_get_lines(buf, lnum, lnum + 1, false)[1]
  --   text = string.rep(" ", indent) .. vim.trim(text)
  --   vim.api.nvim_buf_set_lines(buf, lnum, lnum + 1, false, { text })
  --   end
  --
  -- -- Move cursor to the first argument line
  -- vim.api.nvim_win_set_cursor(0, { row + 1, 0 })
-- end, { remap = false })

-- Highlight whole doc
vim.keymap.set("n", "<leader>a", "ggVG", {})

-- Toggle word wrap by whole word
vim.keymap.set(
    "n",
    "<leader>wr",
    function()
      vim.opt.wrap = not vim.opt.wrap:get()
      vim.opt.linebreak = vim.opt.wrap:get()
      vim.cmd(vim.opt.wrap:get() and "Neominimap BufDisable" or "Neominimap BufEnable")
    end,
    { desc = "Toggle word wrap" }
)

-- Map mouse side buttons
vim.keymap.set("", "<X1Mouse>", "<C-i>", {})
vim.keymap.set("", "<X2Mouse>", "<C-o>", {})

require("lazy").setup("plugins")
