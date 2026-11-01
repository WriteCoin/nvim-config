return {
	{
		"HiPhish/rainbow-delimiters.nvim",
		event = "BufReadPost", -- загрузка при открытии файла
		config = function()
			vim.g.rainbow_delimiters = {
				strategy = {
					[""] = "rainbow-delimiters.strategy.global",
					vim = "rainbow-delimiters.strategy.local",
				},
				query = {
					[""] = "rainbow-delimiters",
					lua = "rainbow-blocks",
				},
				priority = {
					[""] = 110,
					lua = 210,
				},
				highlight = {
					"RainbowDelimiterRed",
					"RainbowDelimiterYellow",
					"RainbowDelimiterBlue",
					"RainbowDelimiterOrange",
					"RainbowDelimiterGreen",
					"RainbowDelimiterViolet",
					"RainbowDelimiterCyan",
				},
			}
		end,
	},
	-- Может решить задачу показа парной закрывающей скобки (в строке статуса или внизу)
	{
		"andymass/vim-matchup",
		init = function()
			-- modify your configuration vars here
			vim.g.matchup_treesitter_stopline = 500

			-- or call the setup function provided as a helper. It defines the
			-- configuration vars for you
			require("match-up").setup({
				treesitter = {
					stopline = 500,
				},
			})
		end,
		-- or use the `opts` mechanism built into `lazy.nvim`. It calls
		-- `require('match-up').setup` under the hood
		---@type matchup.Config
		opts = {
			treesitter = {
				stopline = 500,
			},
		},
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
	-- {
	--     "nvim-telescope/telescope-fzf-native.nvim",
	--     build = "make",
	--     config = function()
	--       require("telescope").load_extension("fzf")
	--     end,
	-- }
	-- Файловый проводник oil.nvim
	-- {
	--       "stevearc/oil.nvim",
	--       dependencies = { "nvim-tree/nvim-web-devicons" },
	--       config = function()
	--           require("oil").setup({
	--               -- Опционально: настроить ключи по вкусу
	--               -- По умолчанию <CR> открывает файл/папку, "-" идёт на уровень выше
	--           })

	--           -- Аналог вашей старой кнопки для открытия проводника
	--           vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
	--       end,
	-- },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				config = function()
					require("telescope").load_extension("fzf")
				end,
			},
		},
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
			{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
			{
				"<leader>/",
				"<cmd>Telescope current_buffer_fuzzy_find<cr>",
				{ desc = "Нечеткий поиск в текущем буфере" },
			},
		},
	},
	-- Навигация по заголовкам
	{
		"crispgm/telescope-heading.nvim",
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				extensions = {
					heading = {
						treesitter = true,
						picker_opts = {
							sorting_strategy = "ascending",
						},
					},
				},
			})
			telescope.load_extension("heading")
		end,
		keys = {
			{ "<leader>h", "<cmd>Telescope heading<cr>", desc = "Навигация по заголовкам" },
		},
	},
	-- Плагин gx.nvim отвечает за базовую функцию "открыть ссылку под курсором"
	-- {
	-- 	"chrishrb/gx.nvim",
	-- 	keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
	-- 	cmd = { "Browse" },
	-- 	init = function()
	-- 		vim.g.netrw_nogx = 1 -- отключить встроенный gx в netrw
	-- 	end,
	-- 	dependencies = { "nvim-lua/plenary.nvim" },
	-- 	config = true,
	-- },
	-- Навигация по ссылкам URL, открытие срабатывает с ошибками
	-- {
	-- 	"HawkinsT/pathfinder.nvim",
	-- 	-- Отложенная загрузка, привязки клавиш настраиваются вручную
	-- 	keys = {
	-- 		-- Использовать select_url() из pathfinder для выбора ссылки (по умолчанию <leader>gx)
	-- 		{
	-- 			"<leader>gx",
	-- 			function()
	-- 				require("pathfinder").select_url()
	-- 			end,
	-- 			desc = "Pathfinder: выбрать URL",
	-- 		},
	-- 		-- Использовать навигационные команды pathfinder для перехода между ссылками
	-- 		{
	-- 			"]u",
	-- 			function()
	-- 				require("pathfinder").next_url()
	-- 			end,
	-- 			desc = "Pathfinder: следующая ссылка",
	-- 		},
	-- 		{
	-- 			"[u",
	-- 			function()
	-- 				require("pathfinder").prev_url()
	-- 			end,
	-- 			desc = "Pathfinder: предыдущая ссылка",
	-- 		},
	-- 	},
	-- 	config = function()
	-- 		-- Отключить синхронную проверку URL для повышения скорости и стабильности
	-- 		require("pathfinder").setup({
	-- 			validate_urls = false,
	-- 		})
	-- 	end,
	-- 	enabled = false,
	-- },
	-- Открыть URL под курсором
	{
		"sontungexpt/url-open",
		event = "VeryLazy",
		init = function()
			vim.g.netrw_nogx = 1
			vim.keymap.set(
				"n",
				"gx",
				"<esc>:URLOpenUnderCursor<cr>",
				{ desc = "Открыть URL под курсором" }
			)
		end,
		-- keys = {
		-- 	{ "gx", "<esc>:URLOpenUnderCursor<cr>", mode = "n", desc = "Открыть URL под курсором" },
		-- },
		cmd = "URLOpenUnderCursor",
		config = function()
			local status_ok, url_open = pcall(require, "url-open")
			if not status_ok then
				return
			end
			url_open.setup({})
			-- vim.keymap.set(
			-- 	"n",
			-- 	"gx",
			-- 	"<esc>:URLOpenUnderCursor<cr>",
			-- 	{ desc = "Открыть URL под курсором" }
			-- )
		end,
	},
}
