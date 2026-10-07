-- Перейти в классический проводник neovim
vim.keymap.set('n', '<leader>E', vim.cmd.Ex)

-- Перейти в проводник Neotree
-- vim.keymap.set('n', '<leader>e', ':Neotree toggle reveal<CR>', { desc = 'Toggle Neo-tree' })

-- Настройка для отключения подсветки поиска (?)
vim.keymap.set('n', '<esc>', ':nohlsearch<CR>', { noremap = true, silent = true })

-- Позволяет перемещать выделенные блоки вверх-вниз
vim.keymap.set('v', 'J', ":'<,'>move '>+1<CR>gv")
vim.keymap.set('v', 'K', ":'<,'>move '<-2<CR>gv")

-- настройка независимости команд от раскладки клавиатуры
-- Пример для русской раскладки (йцукен -> qwerty)
-- vim.o.langmap = "йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,э;,яz,чx,сc,мv,иb,тn,ьm,б,,ю."
-- Включаем опцию, чтобы langmap работал
-- vim.o.langremap = true

-- Выход из Terminal mode по Esc
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Выйти из Terminal mode' })

-- Навигация по окнам из Terminal mode
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h', { desc = 'Окно влево' })
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j', { desc = 'Окно вниз' })
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k', { desc = 'Окно вверх' })
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l', { desc = 'Окно вправо' })
