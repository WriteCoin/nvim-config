return {
    {
        -- Конфигурация LSP
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'mason-org/mason.nvim', config = true },
            'mason-org/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',
            { 'j-hui/fidget.nvim', opts = {} },
        },
        config = function()
            local servers = {
                'lua_ls'
            }

            require('mason').setup()

            local ensure_installed = vim.deepcopy(servers)
            require('mason-tool-installer').setup({ ensure_installed = ensure_installed })

            require('mason-lspconfig').setup({})
        end
    }
}
