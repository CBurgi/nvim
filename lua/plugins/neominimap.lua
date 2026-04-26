return {
      "Isrothy/neominimap.nvim",
      init = function()
            vim.g.neominimap = {
                  auto_enable = true,
                  layout = "split",
                  split = {
                        close_if_last_window = true
                  },
                  click = {
                        enabled = true,
                        auto_switch_focus = false,
                  },
                  mark = {
                        enabled = true,
                  },
                  search = {
                        enabled = true,
                  },
            }
            vim.keymap.set('n', '<leader>mm', "<cmd>Neominimap ToggleFocus<CR>", {})
            vim.keymap.set('n', '<leader>mt', "<cmd>Neominimap Toggle<CR>", {})
            vim.keymap.set('n', '<leader>mr', "<cmd>Neominimap Refresh<CR>", {})
      end
}
