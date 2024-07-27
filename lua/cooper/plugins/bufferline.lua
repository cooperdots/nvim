return {
	"akinsho/bufferline.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline = require("bufferline")
		local hl = {
			error = "#ec5f67",
			warning = "#ecbe7b",
			info = "#1abc9c",
			hint = "#008080",
			grey = "#565f89",
		}

		bufferline.setup({
			options = {
				modified_icon = "●",
				show_close_icon = false,
				show_buffer_close_icons = false,
				always_show_bufferline = true,
			},
			highlights = {
				buffer_selected = { bold = true, italic = false },
				error_selected = { bold = true, italic = false },
				warning_selected = { bold = true, italic = false },
				info_selected = { bold = true, italic = false },

				pick_selected = { italic = false, fg = hl.grey },
				pick_visible = { italic = false, fg = hl.warning },
				pick = { bold = true, italic = false, fg = hl.error },

				modified_selected = { fg = hl.grey },
				modified_visible = { fg = hl.grey },
				modified = { fg = hl.warning },
			},
		})

		vim.keymap.set("n", "<C-j>", function()
			bufferline.cycle(-1)
		end)
		vim.keymap.set("n", "<C-k>", function()
			bufferline.cycle(1)
		end)
	end,
}
