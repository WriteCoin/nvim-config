return {
	-- подсказка привязок, команд
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	-- Строка состояния (дополнительная информация)
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup()
		end,
	},
	-- Проводник файлов на боковой панели (neo-tree)
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},
		lazy = false, -- neo-tree will lazily load itself
		keys = {
			-- { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Toggle Neo-tree" },
			{ "<leader>e", "<cmd>Neotree filesystem reveal left<CR>", desc = "Toggle Neo-tree" },
			{ "<leader>ef", "<cmd>Neotree reveal<CR>", desc = "Reveal current file" },
		},
		config = function()
			require("neo-tree").setup({
				close_if_last_window = true, -- закрывать, если это последнее окно
				popup_border_style = "rounded",
				enable_git_status = true,
				enable_diagnostics = true,

				-- Файловая система
				filesystem = {
					filtered_items = {
						visible = true, -- скрытые файлы показаны
						hide_dotfiles = true, -- .gitignore и т.п. видны
					},
					follow_current_file = {
						enabled = true, -- автофокус на текущем файле
					},
					use_libuv_file_watcher = true, -- автообновление через uv
				},
			})
		end,
	},

	-- Проводник файлов на боковой панели (nvim-tree)
	-- {
	--     "nvim-tree/nvim-tree.lua",
	--     dependencies = {
	--         "nvim-tree/nvim-web-devicons",
	--     },
	--     config = function()
	--         require("nvim-tree").setup({
	--             filesystem_watchers = {
	--                 enable = true,
	--                 debounce_delay = 50,
	--             }
	--         })

	--         vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFile<CR>",
	--             { desc = "Показать текущий файл в дереве" })
	--         -- Перейти в проводник Nvim-tree
	--         vim.keymap.set('n', '<leader>e', ':NvimTreeOpen<CR>', { desc = 'Toggle Nvim-tree' })

	--     end,
	-- }
	-- Новый интерфейс для вкладок буферов
	-- Ошибка несовместимости с ночной версией
	-- {
	-- 	"romgrk/barbar.nvim",
	-- 	dependencies = {
	-- 		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
	-- 		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	-- 	},
	-- 	init = function()
	-- 		vim.g.barbar_auto_setup = false
	-- 	end,
	-- 	opts = {
	-- 		-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
	-- 		-- animation = true,
	-- 		-- insert_at_start = true,
	-- 		-- …etc.
	-- 	},
	-- 	version = "^1.0.0", -- optional: only update when a new 1.x version is released
	-- },
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({})

			-- Пример: использование Alt+h/l для переключения буферов
			vim.keymap.set("n", "<A-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Предыдущий буфер" })
			vim.keymap.set("n", "<A-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Следующий буфер" })
			vim.keymap.set(
				"n",
				"<leader>bp",
				"<cmd>BufferLineTogglePin<CR>",
				{ desc = "Закрепить/открепить буфер" }
			)
			vim.keymap.set(
				"n",
				"<leader>bo",
				"<cmd>BufferLineCloseOthers<CR>",
				{ desc = "Закрыть все буферы, кроме текущего" }
			)
			vim.keymap.set(
				"n",
				"<leader>br",
				"<cmd>BufferLineCloseRight<CR>",
				{ desc = "Закрыть буферы справа" }
			)
			vim.keymap.set(
				"n",
				"<leader>bl",
				"<cmd>BufferLineCloseLeft<CR>",
				{ desc = "Закрыть буферы слева" }
			)
			vim.keymap.set(
				"n",
				"<leader>bc",
				"<cmd>BufferLinePick<CR>",
				{ desc = "Переключать буферы по подсказке" }
			)
		end,
	},
	{
		"ojroques/nvim-bufdel",
		config = function()
			require("bufdel").setup({
				next = "tabs",
				quit = true, -- quit Neovim when last buffer is closed
			})

			vim.keymap.set("n", "<leader>bd", "<cmd>BufDel<CR>", { desc = "Закрыть буфер" })
			vim.keymap.set(
				"n",
				"<leader>baq",
				"<cmd>BufDel!<CR>",
				{ noremap = true, desc = "Закрыть буфер без сохранения изменений" }
			)
		end,
	},
}
