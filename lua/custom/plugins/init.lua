-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {},
    keys = {

      {
        's',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').jump()
        end,
        desc = 'Flash',
      },
    },
  },
  {
    'nvim-pack/nvim-spectre',
  },
  {
    'kdheepak/lazygit.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      vim.keymap.set('n', '<leader>gg', ':LazyGit<CR>', { desc = 'opens lazygit' })
    end,
  },

  {
    'roobert/search-replace.nvim',
    config = function()
      require('search-replace').setup {
        -- optionally ovesride defaults
        default_reslace_single_buffer_options = 'gci',
        default_replace_multi_buffer_options = 'egci',
      }
      vim.keymap.set('n', '<leader>rs', '<cmd>SearchReplaceSingleBufferOpen<cr>', { desc = 'search and replace in this buffer' })
    end,
  },

  {
    'Exafunction/codeium.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp',
    },
    config = function()
      require('codeium').setup {
        enable_chat = true,
      }
    end,
  },

  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    build = ':Copilot auth',
    event = 'BufReadPost',
    opts = {
      suggestion = {
        enabled = false, -- Disable inline suggestions since cmp handles that
        auto_trigger = true,
        hide_during_completion = false, -- Show suggestions during cmp popup
        keymap = {
          accept = false, -- Accept handled via cmp mapping
          next = '<M-]>',
          prev = '<M-[>',
        },
      },
      panel = { enabled = false }, -- Optional panel for showing suggestions
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },

  {
    'zbirenbaum/copilot-cmp',
    event = 'BufReadPost',
    dependencies = { 'zbirenbaum/copilot.lua', 'hrsh7th/nvim-cmp' },
    config = function()
      require('copilot').setup {}
      require('copilot_cmp').setup {}
      print 'Copilot and copilot_cmp loaded'
    end,
  },
}
