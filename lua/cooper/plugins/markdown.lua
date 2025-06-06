return {
	"MeanderingProgrammer/render-markdown.nvim",
	---@module "render-markdown"
	---@type render.md.UserConfig
	opts = {
		bullet = {
			icons = { "•", "◦", "‣", "⁃" },
		},
		completions = {
			blink = {
				enabled = true,
			},
		},
		checkbox = {
			bullet = true,
			unchecked = { icon = " 󰄱 ", highlight = "RenderMarkdownInfo" },
			checked = { icon = "  ", highlight = "RenderMarkdownSuccess" },
			custom = {
				right_arrow = {
					raw = "[>]",
					rendered = "  ",
					highlight = "RenderMarkdownInfo",
					scope_highlight = nil,
				},
				tilde = {
					raw = "[~]",
					rendered = " 󰰱 ",
					highlight = "RenderMarkdownError",
				},
				important = {
					raw = "[!]",
					rendered = "  ",
					highlight = "RenderMarkdownWarn",
				},
				later = {
					raw = "[-]",
					rendered = " 󰥔 ",
					highlight = "RenderMarkdownInfo",
				},
			},
		},
		code = {
			sign = false,
			border = "thick",
			position = "right",
			width = "block",
			right_pad = 8,
		},
		heading = { sign = false },
	},
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
}
