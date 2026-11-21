return {
	{
		"tadmccorkle/markdown.nvim",
		ft = "markdown", -- or 'event = "VeryLazy"'
		opts = {
			-- configuration here or empty for defaults
			mappings = {
				-- Отключить привязку gx по умолчанию
				link_follow = false,
			},
		},
		config = function()
			-- Явно привязать gx в буфере markdown к команде url-open
			vim.keymap.set("n", "gx", "<esc>:URLOpenUnderCursor<cr>", {
				buffer = true,
				desc = "Открыть URL под курсором",
			})
			-- Переход по ссылкам привязать к другой клавише (вместо gx, будет использоваться для открытия URL плагином url-open)
			vim.keymap.set(
				"n",
				"gL",
				"<Plug>(markdown_follow_link)",
				{ buffer = true, desc = "Markdown: переход по ссылке" }
			)
		end,
	},
	{
		"preservim/vim-markdown",
		init = function()
			vim.g.vim_markdown_folding_disabled = 1
		end,
		config = function()
			-- Явно привязать gx в буфере markdown к команде url-open
			vim.keymap.set("n", "gx", "<esc>:URLOpenUnderCursor<cr>", {
				buffer = true,
				desc = "Открыть URL под курсором",
			})
			vim.keymap.set(
				"n",
				"gL",
				"<Plug>Markdown_OpenUrlUnderCursor",
				{ desc = "vim-markdown: открыть ссылку" }
			)
		end,
	},
	-- {
	-- 	"jakewvincent/mkdnflow.nvim",
	-- 	ft = { "markdown", "rmd" }, -- добавление нестандартных типов файлов для настройки здесь
	-- 	config = function()
	-- 		require("mkdnflow").setup({
	-- 			modules = { completion = true },
	-- 			create_dirs = true,
	-- 			-- perspective = {
	-- 			-- 	priority = "root", -- Ключевой параметр: приоритет — интерпретация от корневой директории проекта
	-- 			-- 	root_tell = ".git", -- Файл-маркер корневой директории, например, '.git', 'index.md' и т.д.
	-- 			-- 	fallback = "current", -- Если корневая директория не найдена, откатиться к текущему файлу
	-- 			-- 	nvim_wd_heel = true,
	-- 			-- },
	-- 			path_resolution = {
	-- 				primary = "root",
	-- 				root_marker = ".git",
	-- 				sync_cwd = true,
	-- 			},
	-- 		})
	-- 	end,
	-- },
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
		-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
		-- event = {
		--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
		--   -- refer to `:h file-pattern` for more examples
		--   "BufReadPre path/to/my-vault/*.md",
		--   "BufNewFile path/to/my-vault/*.md",
		-- },
		dependencies = {
			-- Required.
			"nvim-lua/plenary.nvim",

			-- see below for full list of optional dependencies 👇
		},
		opts = {
			workspaces = {
				{
					name = "QuickNotes",
					path = "~/SyncDocuments/QuickNotes",
				},
			},

			-- see below for full list of options 👇
		},
	},
}
