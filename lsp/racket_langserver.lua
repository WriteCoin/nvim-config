-- lsp/racket_langserver.lua
return {
	cmd = { "racket", "--lib", "racket-langserver" },
	filetypes = { "racket", "scheme" },
	root_markers = { ".git" },
}
