return {
	{
		"jellydn/tiny-term.nvim",
		opts = {
			-- your configuration here
		},
		config = function()
			require("tiny-term").setup()

			-- Простое переключение (показать/скрыть) терминала
			vim.keymap.set("n", "<C-/>", function()
				require("tiny-term").toggle()
			end, { desc = "Toggle terminal" })

			-- Поддержка использования цифр для переключения между несколькими терминалами (например, 2<C-/>)
			vim.keymap.set("n", "<C-_>", function()
				local count = vim.v.count1
				require("tiny-term").toggle(nil, { count = count })
			end, { desc = "Toggle terminal with count" })
		end,
	},
	{
		"willothy/flatten.nvim",
		config = true,
		-- or pass configuration with
		-- opts = {  }
		-- Ensure that it runs first to minimize delay when opening file from terminal
		lazy = false,
		priority = 1001,
	},
}
