return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")

		-- Устанавливаем парсеры (это асинхронно)
		ts.install({
			"lua",
			"vim",
			"vimdoc",
			"python",
			"javascript",
			"typescript",
			"tsx",
			"markdown",
			"markdown_inline",
			"commonlisp",
			"fennel",
			"typst",
		})

		-- Включаем подсветку БЕЗОПАСНО: проверяем, готов ли парсер
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(ev)
				local lang = vim.treesitter.language.get_lang(ev.match) or ev.match
				-- Безопасный вызов: если парсер не готов, Neovim просто молчит
				pcall(vim.treesitter.start, ev.buf, lang)
			end,
		})
	end,
}
