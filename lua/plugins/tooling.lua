require("mason").setup()

require("mason-tool-installer").setup({
	ensure_installed = {
		"stylua",
		"shellcheck",
		"shfmt",
		"editorconfig-checker",
		"eslint",
		"prettier",
		"flake8",
		"black",
	},
})
