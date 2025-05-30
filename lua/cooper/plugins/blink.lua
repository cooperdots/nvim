return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "1.*",

	---@module "blink.cmp"
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "none",
			["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide", "fallback" },
			["<C-s>"] = { "show_signature", "hide_signature", "fallback" },

			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<C-p>"] = { "select_prev", "fallback_to_mappings" },
			["<C-n>"] = { "select_next", "fallback_to_mappings" },

			["Tab"] = { "snippet_forward", "fallback" },
			["S-Tab"] = { "snippet_backward", "fallback" },

			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },

			["<CR>"] = { "accept", "fallback" },
		},
		appearance = {
			nerd_font_variant = "mono",
		},
		signature = {
			enabled = true,
			window = {
				show_documentation = true,
			},
		},
		sources = {
			default = {
				"lsp",
				"path",
				"snippets",
				"buffer",
			},
		},
		completion = {
			documentation = {
				auto_show = true,
			},
		},
	},
	opts_extend = { "sources.default" },
}
