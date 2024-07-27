return {
	{
		"petertriho/nvim-scrollbar",
		opts = {},
	},
	{
		"unblevable/quick-scope",
		init = function()
			vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
		end,
	},
	{
		"m-demare/hlargs.nvim",
		config = true,
	},
	"machakann/vim-sandwich",
}
