return {
  'stevearc/aerial.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    layout = {
      default_direction = 'right',
      min_width = 30,
    },
    attach_mode = 'global',
    filter_kind = false,
  },
  keys = {
    { '<leader>cs', '<cmd>AerialToggle<cr>', desc = 'Toggle Symbols Outline' },
    { '{', '<cmd>AerialPrev<cr>', desc = 'Prev Symbol' },
    { '}', '<cmd>AerialNext<cr>', desc = 'Next Symbol' },
  },
}
