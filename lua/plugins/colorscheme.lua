-- function ColorMyPencils(color)
--   color = color or 'nord'
--   vim.cmd.colorscheme(color)
--
--   vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
--   vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
--   vim.api.nvim_set_hl(0, 'LineNr', { bg = 'none' })         -- Transparent line numbers
--   vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })     -- Transparent sign column
--   vim.api.nvim_set_hl(0, 'GitSignsAdd', { bg = 'none' })    -- Transparent background for added lines
--   vim.api.nvim_set_hl(0, 'GitSignsChange', { bg = 'none' }) -- Transparent background for changed lines
--   vim.api.nvim_set_hl(0, 'GitSignsDelete', { bg = 'none' }) -- Transparent background for deleted lines
--   vim.api.nvim_set_hl(0, 'MsgArea', { bg = 'none' })        -- Transparent background for messages
--   vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })    -- Transparent border for floating windows
--   vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })          -- Transparent background for pop-up menus
-- end
--
-- return {
--   'shaunsingh/nord.nvim',
--   priority = 1000,
--   init = function()
--     vim.cmd.colorscheme 'nord'
--     ColorMyPencils()
--   end,
-- }
-- return {
--   'catppuccin/nvim',
--   init = function()
--     vim.cmd.colorscheme 'catppuccin'
--   end,
--   config = function()
--     require('catppuccin').setup {
--       transparent_background = true,
--     }
--   end,
return {
  -- 'EdenEast/nightfox.nvim',
  -- init = function()
  -- vim.cmd.colorscheme 'carbonfox'
  -- end,
  'folke/tokyonight.nvim',
  init = function()
    require('tokyonight').setup {
      transparent_mode = true,
      bold = false,
      contrast = 'hard',
      italic = {
        string = false,
        emphasis = false,
        comments = false,
        operators = false,
        folds = false,
      },
    }

    vim.cmd.colorscheme 'tokyonight-night'
  end,

  -- 'shaunsingh/nord.nvim',
  -- lazy = false,
  -- priority = 1000,
  -- config = function()
  --   -- Example config in lua
  --   vim.g.nord_contrast = true
  --   vim.g.nord_borders = false
  --   vim.g.nord_disable_background = true
  --   vim.g.nord_italic = false
  --   vim.g.nord_uniform_diff_background = true
  --   vim.g.nord_bold = false
  --
  --   -- Load the colorscheme
  --   require('nord').set()
  --
  --   -- Toggle background transparency
  --   local bg_transparent = true
  --
  --   local toggle_transparency = function()
  --     bg_transparent = not bg_transparent
  --     vim.g.nord_disable_background = bg_transparent
  --     vim.cmd [[colorscheme nord]]
  --   end
  --
  --   vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
  -- end,
}
