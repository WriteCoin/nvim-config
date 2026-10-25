return {
	{
		"guns/vim-sexp",
		lazy = false,
		init = function()
			vim.g.sexp_filetypes = "clojure,scheme,lisp,timl,fennel,janet,racket"
		end,
	},
	{ "https://github.com/tpope/vim-sexp-mappings-for-regular-people" },
}
