-- Для плагина nvim-tree
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Настройка нумерации строк в файле и относительная нумерация
vim.opt.nu = true
vim.opt.relativenumber = true

-- Интеграция системного буфера обмена
vim.o.clipboard = "unnamedplus"

-- Чтобы лучше отображались цвета
vim.o.termguicolors = true

-- Настройки отступов
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Автоматическая расстановка отступов
vim.opt.smartindent = true

-- Комфортная прокрутка окна относительно курсора
vim.opt.scrolloff = 5

-- Скрытые буферы
vim.opt.hidden = true

-- Поддержка Nerd Font (иконок, для Lualine)
vim.g.have_nerd_font = true

-- Показывать текущий режим внизу
vim.opt.showmode = false

-- Настройка учета регистра для поиска
-- vim.opt.smartcase = true

-- задержка продолжения последовательности клавиш
vim.opt.timeoutlen = 300

-- Отображение дополнительных окон (снизу и справа, а не вверху, по умолчанию)
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Подсветка строки, на которой находится курсор
vim.opt.cursorline = false

-- Подсветка при поиске
-- vim.opt.hlsearch = true

