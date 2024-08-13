return {
	"nvim-lualine/lualine.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local lualine = require("lualine")

		-- Color table for highlights
		local colors = {
			-- bg = "#18181f",
			bg = "#2A2A37",
			fg = "#bbc2cf",
			blue = "#7daea3",
			cyan = "#89b482",
			purple = "#d3869b",
			orange = "#e78a4e",
			yellow = "#d8a657",
			green = "#a9b665",
			magenta = "#d3869b",
			red = "#ea6962",
			violet = "#a9a1e1",
		}

		local conditions = {
			buffer_not_empty = function()
				return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
			end,
			hide_in_width = function()
				return vim.fn.winwidth(0) > 80
			end,
		}

		-- Config
		local config = {
			options = {
				-- Disable sections and component separators
				component_separators = "",
				section_separators = "",
				theme = "auto",
				globalstatus = true,
			},
			sections = {
				-- these are to remove the defaults
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				-- These will be filled later
				lualine_c = {},
				lualine_x = {},
			},
			inactive_sections = {
				-- these are to remove the defaults
				lualine_a = {},
				lualine_v = {},
				lualine_y = {},
				lualine_z = {},
				lualine_c = {},
				lualine_x = {},
			},
			--extensions = {
			--require("cooper.line.tree");
			--require("cooper.line.terminal");
			--}
		}

		-- Inserts a component in lualine_c at left section
		local function ins_left(component)
			table.insert(config.sections.lualine_c, component)
		end
		local function ins_inactive_left(component)
			table.insert(config.inactive_sections.lualine_c, component)
		end

		-- Inserts a component in lualine_x ot right section
		local function ins_right(component)
			table.insert(config.sections.lualine_x, component)
		end
		local function ins_inactive_right(component)
			table.insert(config.inactive_sections.lualine_x, component)
		end

		-- Auto-change color according to neovim's mode
		local modes = {
			n = { icon = "", color = colors.green },
			i = { icon = "", color = colors.blue },
			v = { icon = "󰈈", color = colors.yellow },
			[""] = { icon = "", color = colors.yellow },
			V = { icon = "󰘢", color = colors.yellow },
			c = { icon = "", color = colors.magenta },
			no = { icon = "", color = colors.red },
			s = { icon = "", color = colors.orange },
			S = { icon = "", color = colors.orange },
			[""] = { icon = "", color = colors.orange },
			ic = { icon = "", color = colors.yellow },
			R = { icon = "", color = colors.red },
			Rv = { icon = "", color = colors.red },
			cv = { icon = "", color = colors.red },
			ce = { icon = "", color = colors.red },
			r = { icon = "", color = colors.cyan },
			rm = { icon = "", color = colors.cyan },
			["r?"] = { icon = "", color = colors.cyan },
			["!"] = { icon = "", color = colors.red },
			t = { icon = "", color = colors.orange },
		}

		ins_left({
			function()
				return "▊"
			end,
			color = { fg = colors.blue }, -- Sets highlighting of component
			left_padding = 0, -- We don't need space before this
		})

		ins_left({
			-- mode component
			function()
				local mode = modes[vim.fn.mode()]
				vim.api.nvim_command("hi! LualineMode guifg=" .. mode.color .. " guibg=" .. colors.bg)
				if mode.icon == "" then
					return ""
				end
				return mode.icon
			end,
			color = "LualineMode",
		})

		ins_left({
			"filename",
			file_status = false,
			condition = conditions.buffer_not_empty,
			color = { fg = colors.magenta, gui = "bold" },
		})

		ins_left({
			"filetype",
			colored = true,
			right_padding = 0,
			format = function()
				return " "
			end,
		})

		ins_left({
			"diagnostics",
			sources = { "nvim_diagnostic" },
			symbols = { error = " ", warn = " ", info = " ", hint = " " },
			color_error = colors.red,
			color_warn = colors.yellow,
			color_info = colors.cyan,
			left_padding = 0,
		})

		ins_right({
			"diff",
			symbols = { added = "+", modified = "~", removed = "-" },
			color_added = colors.green,
			color_modified = colors.yellow,
			color_removed = colors.red,
			condition = conditions.hide_in_width,
		})

		ins_right({
			"branch",
			icon = "",
			color = { fg = colors.magenta, gui = "bold" },
		})

		ins_right({ "location", left_padding = 0 })
		ins_right({ "progress", color = { fg = colors.fg, gui = "bold" } })

		ins_right({
			function()
				return "▊"
			end,
			color = { fg = colors.blue },
			right_padding = 0,
		})

		ins_inactive_left({
			function()
				return "▊"
			end,
			left_padding = 0,
		})

		ins_inactive_left({
			-- mode component
			function()
				local mode = modes[vim.fn.mode()]
				if mode.icon == "" then
					return ""
				end
				return mode.icon
			end,
		})

		ins_inactive_left({
			"filename",
			file_status = false,
			condition = conditions.buffer_not_empty,
			color = nil,
		})

		ins_inactive_left({
			"filetype",
			colored = false,
			right_padding = 0,
			format = function()
				return " "
			end,
		})

		ins_inactive_right({
			"branch",
			icon = "",
			color = nil,
		})

		ins_inactive_right({ "location", left_padding = 0 })
		ins_inactive_right({ "progress", color = nil })

		ins_inactive_right({
			function()
				return "▊"
			end,
			right_padding = 0,
		})

		lualine.setup(config)
	end,
}
