-- { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...}
return {
  'ellisonleao/gruvbox.nvim',
  name = 'gruvbox',
  config = function()
    vim.cmd 'colorscheme gruvbox'
  end,
}
