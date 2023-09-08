local setup_indent_blankline = function()
	vim.g.indent_blankline_use_treesitter = true
	vim.g.indent_blankline_filetype_exclude = {
		"help",
		"dashboard",
		"dashpreview",
		"coc-explorer",
		"startify",
		"vista",
		"sagahover",
		"lspinfo",
	}

	vim.opt.list = true
	vim.opt.listchars:append("space:⋅")
	vim.opt.listchars:append("eol:↴")

	require("indent_blankline").setup({
		space_char_blankline = " ",
		show_current_context = true,
		show_current_context_start = true,
	})

	local wk = require("which-key")

	wk.register({
		t = {
			i = {
				function()
					vim.cmd("IndentBlanklineToggle!")
					if vim.g.indent_blankline_enabled then
						vim.opt.list = true
					else
						vim.opt.list = false
					end
				end,
				"Indent guides",
			},
		},
	}, {
		prefix = "<leader>",
	})
end

local setup_zen_mode = function()
	require("zen-mode").setup()

	local wk = require("which-key")

	wk.register({
		t = {
			z = { "<cmd>ZenMode<CR>", "Zen mode" },
		},
	}, {
		prefix = "<leader>",
	})
end

local setup_twilight = function()
	require("twilight").setup({
		treesitter = true,
		expand = {
			"function",
			"method",
			"table",
			"if_statement",
		},
	})

	local wk = require("which-key")

	wk.register({
		t = {
			t = { "<cmd>Twilight<CR>", "Twilight" },
		},
	}, {
		prefix = "<leader>",
	})
end

return {
	{ "stevearc/dressing.nvim", event = "VeryLazy" },
	{ "lukas-reineke/indent-blankline.nvim", event = "VeryLazy", init = setup_indent_blankline },
	{ "folke/zen-mode.nvim", init = setup_zen_mode },
	{ "folke/twilight.nvim", init = setup_twilight },
	{ "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" },
	{ "nvim-tree/nvim-web-devicons", opts = { default = true } },
	"norcalli/nvim-colorizer.lua",
}
