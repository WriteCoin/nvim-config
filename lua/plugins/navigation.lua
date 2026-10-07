return {
  {
    'HiPhish/rainbow-delimiters.nvim',
    event = 'BufReadPost', -- загрузка при открытии файла
    config = function()
      vim.g.rainbow_delimiters = {
        strategy = {
          [''] = 'rainbow-delimiters.strategy.global',
          vim = 'rainbow-delimiters.strategy.local',
        },
        query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
        },
        priority = {
          [''] = 110,
          lua = 210,
        },
        highlight = {
          'RainbowDelimiterRed',
          'RainbowDelimiterYellow',
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
        },
      }
    end,
  },
    -- Приспособить русскую раскладку к командам
    -- {
    --     'Wansmer/langmapper.nvim',
    --     lazy = false,
    --     priority = 1, -- High priority is needed if you will use `autoremap()`
    --     config = function()
    -- 		require('langmapper').setup({--[[ your config ]]})
    --     end,
    -- },

}
