-- ~/.config/nvim/after/ftplugin/markdown.lua

-- 1. Определите цвета, которые вам нравятся (здесь приведены примеры, замените на нужные вам значения)
local link_text_color = "#7aa2f7" -- Цвет текста ссылки (например, синий)
local url_color = "#9ece6a" -- Цвет URL (например, зеленый)
local url_underline = true -- Нужно ли подчеркивание

-- 2. Переопределите или определите группы подсветки, используемые vim-markdown
-- Группа подсветки текста ссылки (например, [this part])
vim.api.nvim_set_hl(0, "mkdLink", {
	fg = link_text_color,
	bold = true, -- Вы можете добавить жирный шрифт и другие стили
})

-- Группа подсветки URL (например, (https://...))
vim.api.nvim_set_hl(0, "mkdURL", {
	fg = url_color,
	underline = url_underline,
})

-- Группа подсветки URL (например, (https://...))
vim.api.nvim_set_hl(0, "mkdInlineURL", {
	fg = url_color,
	underline = url_underline,
})

-- Если вы также хотите настроить цвет разделителей ссылок ([] и ()), они обычно используют mkdDelimiter
-- vim.api.nvim_set_hl(0, "mkdDelimiter", { fg = "#565f89" })
