return {
    -- Строка состояния (дополнительная информация)
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup()
        end
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
                        hide_dotfiles = true -- .gitignore и т.п. видны
                    },
                    follow_current_file = {
                        enabled = true, -- автофокус на текущем файле
                    },
                    use_libuv_file_watcher = true -- автообновление через uv
                }
            })
        end
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
}
