return {
	"MeanderingProgrammer/render-markdown.nvim",
	---@module "render-markdown"
	---@type render.md.UserConfig
	opts = {
		code = {
			border = "thick",
			sign = false,
		},
		checkbox = {
			position = "overlay",
		},
	},
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
}
