return {
	"rebelot/kanagawa.nvim",
	priority = 1000, -- Make sure to load this before all the other start plugins.
	config = function()
		local colors = require("kanagawa.colors").setup()
		require("kanagawa").setup({
			keywordStyle = {},
			-- overrides = function(colors)
			-- 	return {
			overrides = {
				Cursor = { bg = colors.springGreen },
				CursorIM = { bg = colors.crystalBlue },
				CursorRM = { bg = colors.autumnRed },
				CursorVM = { bg = colors.autumnYellow },
				CursorCM = { bg = colors.oniViolet },

				Visual = { reverse = true },

				MatchParen = { bold = false },

				-- rustSigil = { link = "Constant" },

				Hlargs = { link = "Constant" },

				QuickScopePrimary = { reverse = true },
				QuickScopeSecondary = { underline = true },
			},
			-- 	}
			-- end,
		})
	end,
	-- opts = {
	-- 	compile = true,
	-- 	keywordStyle = {},
	-- 	overrides = function()
	-- 		return {
	-- 			-- Cursor = { bg = colors.palette.springGreen },
	-- 		}
	-- 	end,
	-- },
	init = function()
		vim.cmd.colorscheme("kanagawa")

		-- You can configure highlights by doing something like:
		-- vim.cmd.hi("Comment gui=none")
	end,
}
