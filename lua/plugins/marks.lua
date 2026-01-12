return {
  "chentoast/marks.nvim",
  event = "VeryLazy",
  opts = {},
  config = function ()
    require('marks').setup {
      default_mappings = false,
      mappings = {
        set = "m",
        next = "mn",
        prev = "mN",
        delete = "dm",
        delete_line = "dm-",
        delete_buf = "dm_",
        toggle = "m,",
      }
    }
    vim.keymap.set('n', '<leader>lm', '<cmd>MarksListBuf<CR>', {})
    vim.keymap.set('n', '<leader>lam', '<cmd>MarksListAll<CR>', {})
  end
}
