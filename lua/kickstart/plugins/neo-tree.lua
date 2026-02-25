-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '<leader>e', ':Neotree toggle<CR>', desc = 'NeoTree toggle', silent = true },
    { '<leader>fe', ':Neotree reveal<CR>', desc = 'NeoTree reveal file', silent = true },
    { '<leader>ee', ':Neotree git_status git_base=main<CR>', desc = 'NeoTree git status (vs main)', silent = true },
    {
      '<leader>fE',
      function()
        local path = vim.fn.expand '%:p:h'
        if vim.fn.has 'macunix' == 1 then
          vim.fn.jobstart({ 'open', path }, { detach = true })
        elseif vim.fn.has 'unix' == 1 then
          vim.fn.jobstart({ 'xdg-open', path }, { detach = true })
        elseif vim.fn.has 'win32' == 1 then
          vim.fn.jobstart { 'explorer', path }
        end
      end,
      desc = 'Open folder in system file manager',
      silent = true,
    },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['<leader>e'] = 'close_window',
        },
      },
    },
  },
}
