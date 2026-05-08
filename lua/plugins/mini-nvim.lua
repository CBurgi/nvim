return {
  {
    'nvim-mini/mini.nvim',
    lazy = false,
    version = '*',
    config = function()
      require('mini.trailspace').setup({})
      require('mini.indentscope').setup({
        draw = {
          delay = 0,
          animation = require('mini.indentscope').gen_animation.none()
        },
        options = {
          indent_at_cursor = false
        }
      })
      require('mini.jump').setup({})
      require('mini.basics').setup({
        mappings = {
          basic = false,
          windows = true,
          move_with_alt = true,
        }
      })
      require('mini.surround').setup({
        mappings = {
          suffix_last = 'a'
        }
      })
      require('mini.splitjoin').setup({
        mappings = {
          toggle = '',
          split = 'gs',
          join = 'gj'
        }
      })
      require('mini.operators').setup({})
      require('mini.move').setup({
        mappings = {
          -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
          left = '<C-h>',
          right = '<C-l>',
          down = '<C-j>',
          up = '<C-k>',

          -- Cove current line in Normal mode
          line_left = '<C-h>',
          line_right = '<C-l>',
          line_down = '<C-j>',
          line_up = '<C-k>',
        }
      })
      require('mini.comment').setup({})
      require('mini.align').setup({})
      require('mini.ai').setup({})
    end,
    keys = {
      {
        "<leader>tr",
        function()
          require('mini.trailspace').trim()
          require('mini.trailspace').trim_last_lines()
        end
        ,
        desc = "trailspace - clear trailing spaces/lines"
      }
    }
  }
}
