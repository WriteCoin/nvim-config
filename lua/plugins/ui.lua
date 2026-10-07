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
    -- {
    --     "nvim-neo-tree/neo-tree.nvim",
    --     branch = "v3.x",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --         "MunifTanjim/nui.nvim",
    --         "nvim-tree/nvim-web-devicons", -- optional, but recommended
    --     },
    --     lazy = false, -- neo-tree will lazily load itself
    -- }
    
    -- Проводник файлов на боковой панели (nvim-tree)
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup({
                filesystem_watchers = {
                    enable = true,
                    debounce_delay = 50,
                }
            })

            vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFile<CR>",
                { desc = "Показать текущий файл в дереве" })
            -- Перейти в проводник Nvim-tree
            vim.keymap.set('n', '<leader>e', ':NvimTreeOpen<CR>', { desc = 'Toggle Nvim-tree' })

        end,
    }
}
