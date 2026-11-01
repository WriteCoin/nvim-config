local color_link = "#7aa2f7"
local color_url = "#9ece6a"
local url_underline = true -- Нужно ли подчеркивание

-- -- 2. Переопределите или определите группы подсветки, используемые vim-markdown
-- -- Группа подсветки текста ссылки (например, [this part])
-- vim.api.nvim_set_hl(0, "mkdLink", {
-- 	fg = color_link,
-- 	bold = true, -- Вы можете добавить жирный шрифт и другие стили
-- })
--
-- -- Группа подсветки URL (например, (https://...))
-- vim.api.nvim_set_hl(0, "mkdURL", {
-- 	fg = color_url,
-- 	underline = url_underline,
-- })
--
-- -- Группа подсветки URL (например, (https://...))
-- vim.api.nvim_set_hl(0, "mkdInlineURL", {
-- 	fg = color_url,
-- 	underline = url_underline,
-- })

vim.api.nvim_set_hl(0, "@markup.link", { fg = color_link, bold = true })
vim.api.nvim_set_hl(0, "@markup.link.url", { fg = color_url, underline = true })

-- Переопределить группу семантических токенов LSP для ссылок
vim.api.nvim_set_hl(0, "@lsp.type.decorator.markdown", { fg = color_url, bold = true })
-- Для голых URL
vim.api.nvim_set_hl(0, "@text.uri", { fg = color_url, underline = true })
