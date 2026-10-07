return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")

    -- Устанавливаем парсеры (это асинхронно)
    ts.install({ "lua", "vim", "vimdoc", "python", "javascript", "markdown" })

    -- Включаем подсветку БЕЗОПАСНО: проверяем, готов ли парсер
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        -- Безопасный вызов: если парсер не готов, Neovim просто молчит
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
