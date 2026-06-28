return {
  "wurli/split.nvim",
  config = function()
    require("split").setup({
      keymaps = {
        ["ss"] = {
          pattern = ",",
          interactive = true,
          operator_pending = true,
        }
      },
      -- interactive_options = {
      --   ["<leader>"] = "[ ]"
      -- },
    })
  end,
}
