return {
	"rebelot/kanagawa.nvim",
	priority = 1000, -- Make sure to load this before all the other start plugins.
	---@module "kanagawa"
	---@type KanagawaConfig
	opts = {
		keywordStyle = { italic = false },
		overrides = function(colors)
			return {
				Cursor = { bg = colors.palette.springGreen },
				CursorIM = { bg = colors.palette.crystalBlue },
				CursorRM = { bg = colors.palette.autumnRed },
				CursorVM = { bg = colors.palette.autumnYellow },
				CursorCM = { bg = colors.palette.oniViolet },

				DiagnosticUnderlineError = { undercurl = false, underline = true },
				DiagnosticUnderlineHint = { undercurl = false, underline = true },
				DiagnosticUnderlineInfo = { undercurl = false, underline = true },
				DiagnosticUnderlineWarn = { undercurl = false, underline = true },

				Visual = { reverse = true },
				MatchParen = { bold = false },

				Hlargs = { link = "Constant" },

				QuickScopePrimary = { reverse = true },
				QuickScopeSecondary = { underline = true },
			}
		end,
	},
	init = function()
		vim.cmd.colorscheme("kanagawa")

		-- You can configure highlights by doing something like:
		-- vim.cmd.hi("Comment gui=none")
	end,
}
