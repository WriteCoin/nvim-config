return {
	{
		-- "guns/vim-sexp",
		"benknoble/vim-sexp", -- предполагаемый форк
		lazy = false,
		init = function()
			vim.g.sexp_filetypes = "clojure,scheme,lisp,timl,fennel,janet,racket"
			vim.g.sexp_enable_insert_mode_mappings = 0
		end,
	},
	{
		"https://github.com/tpope/vim-sexp-mappings-for-regular-people",
		lazy = false,
		-- dependencies = { "guns/vim-sexp" },
		dependencies = { "benknoble/vim-sexp" },
	},
}
