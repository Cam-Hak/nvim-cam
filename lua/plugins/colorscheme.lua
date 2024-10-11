function ColorMyPencils(color)
  color = color or 'rose-pine'
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'LineNr', { bg = 'none' })         -- Transparent line numbers
  vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })     -- Transparent sign column
  vim.api.nvim_set_hl(0, 'GitSignsAdd', { bg = 'none' })    -- Transparent background for added lines
  vim.api.nvim_set_hl(0, 'GitSignsChange', { bg = 'none' }) -- Transparent background for changed lines
  vim.api.nvim_set_hl(0, 'GitSignsDelete', { bg = 'none' }) -- Transparent background for deleted lines
  vim.api.nvim_set_hl(0, 'MsgArea', { bg = 'none' })        -- Transparent background for messages
  vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })    -- Transparent border for floating windows
  vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })          -- Transparent background for pop-up menus
end

return {
  'rose-pine/neovim',
  transparent = true,
  priority = 1000,
  init = function()
    vim.cmd.colorscheme 'rose-pine'
    ColorMyPencils()
  end,
}
