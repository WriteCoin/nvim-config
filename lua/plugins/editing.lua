return {
    -- выравнивание строк
    {
        "junegunn/vim-easy-align",
        config = function()
            vim.api.nvim_set_keymap('x', 'ga', '<Plug>(EasyAlign)', {})
            vim.api.nvim_set_keymap('n', 'ga', '<Plug>(EasyAlign)', {})
        end
    },
    -- позволяет повторять сложные действия `vim-sexp` с помощью команды `.`
    {
        "tpope/vim-repeat", event = "VeryLazy"
    }
}
