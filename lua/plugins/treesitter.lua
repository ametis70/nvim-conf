return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			if not configs then
				vim.cmd([[ echom 'Cannot load `nvim-treesitter.configs`' ]])
				return
			end

			require("orgmode").setup_ts_grammar()
			require("nvim-ts-autotag").setup()

			configs.setup({
				ensure_installed = {
					"arduino",
					"bash",
					"bibtex",
					"c",
					"c_sharp",
					"cmake",
					"clojure",
					"commonlisp",
					"cpp",
					"css",
					"csv",
					"dart",
					"diff",
					"dockerfile",
					"dot",
					"fennel",
					"fish",
					"gdscript",
					"git_config",
					"git_rebase",
					"gitattributes",
					"gitcommit",
					"gitignore",
					"go",
					"gpg",
					"graphql",
					"html",
					"http",
					"ini",
					"java",
					"javascript",
					"jq",
					"jsdoc",
					"json",
					"json5",
					"jsonc",
					"kotlin",
					"latex",
					"llvm",
					"lua",
					"luadoc",
					"luap",
					"luau",
					"make",
					"markdown",
					"markdown_inline",
					"meson",
					"ninja",
					"nix",
					"pem",
					"perl",
					"php",
					"python",
					"requirements",
					"ruby",
					"rust",
					"scss",
					"sql",
					"toml",
					"tsx",
					"typescript",
					"vim",
					"vimdoc",
					"vue",
					"xml",
					"yaml",
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = { "org" },
				},
				indent = {
					enable = true,
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "gnn",
						node_incremental = "grn",
						scope_incremental = "grc",
						node_decremental = "grm",
					},
				},
				context_commentstring = {
					enable = true,
				},
				autotag = {
					enable = true,
				},
			})
		end,
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			"windwp/nvim-ts-autotag",
			"nvim-orgmode/orgmode",
		},
	},
}
