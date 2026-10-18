return {
	-- Переводчик слов естественного языка (не работает)
	-- {
	-- 	"voldikss/vim-translator",
	-- 	config = function()
	-- 		-- Установка целевого языка для переводчика
	-- 		vim.g.translator_target_lang = "ru"

	-- 		-- Явно указать движки: попробовать Bing, Youdao, Google по порядку
	-- 		vim.g.translator_default_engines = { "bing", "youdao", "google" }

	-- 		vim.g.translator_proxy_url = "socks5://127.0.0.1:1080" -- измените на фактический адрес прокси

	-- 		-- 1. Перевод в обычном режиме и вывод в командной строке
	-- 		vim.keymap.set(
	-- 			"n",
	-- 			"<Leader>tr",
	-- 			"<Plug>Translate",
	-- 			{ silent = true, desc = "Перевести слово под курсором" }
	-- 		)

	-- 		-- 2. Перевод в визуальном режиме и вывод в командной строке
	-- 		vim.keymap.set(
	-- 			"v",
	-- 			"<Leader>tr",
	-- 			"<Plug>TranslateV",
	-- 			{ silent = true, desc = "Перевести выделенный текст" }
	-- 		)

	-- 		-- 3. Перевод в обычном режиме и отображение в плавающем окне
	-- 		vim.keymap.set(
	-- 			"n",
	-- 			"<Leader>tw",
	-- 			"<Plug>TranslateW",
	-- 			{ silent = true, desc = "Перевести слово (плавающее окно)" }
	-- 		)

	-- 		-- 4. Перевод в визуальном режиме и отображение в плавающем окне
	-- 		vim.keymap.set("v", "<Leader>tw", "<Plug>TranslateWV", {
	-- 			silent = true,
	-- 			desc = "Перевести выделенный текст (плавающее окно)",
	-- 		})

	-- 		-- 5. Перевод в обычном режиме и замена исходного текста
	-- 		vim.keymap.set(
	-- 			"n",
	-- 			"<Leader>tR",
	-- 			"<Plug>TranslateR",
	-- 			{ silent = true, desc = "Перевести и заменить слово" }
	-- 		)

	-- 		-- 6. Перевод в визуальном режиме и замена исходного текста
	-- 		vim.keymap.set(
	-- 			"v",
	-- 			"<Leader>tR",
	-- 			"<Plug>TranslateRV",
	-- 			{ silent = true, desc = "Перевести и заменить выделенный текст" }
	-- 		)
	-- 	end,
	-- },

	-- Плагин перевода слов естественного языка (не работает)
	-- {
	-- 	"Omochice/dps-translate-vim",
	-- 	dependencies = {
	-- 		"vim-denops/denops.vim",
	-- 	},
	-- 	config = function()
	-- 		vim.g.dps_translate_source = "en"
	-- 		vim.g.dps_translate_target = "ru"
	-- 	end,
	-- },

	-- Плагин перевода, базирующийся на внешних средствах, в т.ч. Translate Shell
	{
		"uga-rosa/translate.nvim",
		config = function()
			require("translate").setup({
				default = {
					-- Используется консольная программа Translate Shell, ее необходимо установить в системе
					command = "translate_shell",
					output = "insert",
				},
				preset = {
					output = {
						-- окно занимает всю ширину редактора и никак не настраивается
						split = {
							append = true,
							base = "bottom",
							position = "bottom",
							min_size = 5,
							max_size = 0.5,
							off = -1,
						},
						-- Вставляется со слишком большими отступами от исходной позиции переводимого текста
						-- Вставляется в конец строки при любом раскладе, непонятно, как настроить
						insert = {
							append = true,
							base = "bottom",
							off = 0,
						},
						-- Придется использовать метод регистров, копирование и вставка
						register = {
							name = "a",
						},
					},
				},
			})

			-- Привязка для визуального режима
			vim.keymap.set("v", "<leader>tw", ":Translate RU -output=split<CR>", {
				desc = "Перевести и вставить в окне с сохранением позиции буфера",
			})
			vim.keymap.set(
				"v",
				"<leader>tr",
				":Translate RU -output=register<CR>",
				{ desc = "Перевести и вставить в регистр" }
			)

			vim.keymap.set(
				"v",
				"<leader>ti",
				":Translate RU -output=insert<CR>",
				{ desc = "Перевести и вставить на следующей строке в буфере" }
			)

			vim.keymap.set(
				"v",
				"<leader>tf",
				":Translate RU -output=floating<CR>",
				{ desc = "Перевести и показать перевод в плавающем окне" }
			)
		end,
	},
}
