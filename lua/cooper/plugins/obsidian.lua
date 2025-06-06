return {
	"obsidian-nvim/obsidian.nvim",
	lazy = true,
	event = {
		"BufReadPre " .. vim.fn.expand("~") .. "/ob/*.md",
		"BufNewFile " .. vim.fn.expand("~") .. "/ob/*.md",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	---@module "obsidian"
	---@type obsidian.config.ClientOpts | table<string, any>
	opts = {
		completion = {
			nvim_cmp = false,
			blink = true,
			min_chars = 2,
			match_case = false,
			default = nil,
		},
		workspaces = {
			{
				name = "ob",
				path = "~/ob",
			},
		},
	},
}
