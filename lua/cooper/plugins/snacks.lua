return {
	"folke/snacks.nvim",
	lazy = false,
	---@module "snacks"
	---@type snacks.Config
	opts = {
		picker = {},
		scroll = {
			animate = {
				step = 1,
				total = 200,
			},
			animate_repeat = {
				delay = 0,
			},
		},
		toggle = {},
	},
	keys = {
		{
			"<leader>sf",
			function()
				if Snacks.git.get_root() == nil then
					Snacks.picker.files()
				else
					Snacks.picker.git_files()
				end
			end,
			desc = "[S]earch [F]iles with Git",
		},
		{
			"<leader>sg",
			function()
				Snacks.picker.git_diff()
			end,
			desc = "[S]earch by [G]it status",
		},
		{
			"<leader>sF",
			function()
				Snacks.picker.files()
			end,
			desc = "[S]earch [F]iles",
		},
		{
			"<leader>sn",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "[S]earch [N]eovim Config File",
		},

		{
			"<leader>sG",
			function()
				Snacks.picker.grep()
			end,
			desc = "[S]earch by [G]rep",
		},
		{
			"<leader>sw",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "[S]earch current [W]ord",
		},
		{
			"<leader>sh",
			function()
				Snacks.picker.help()
			end,
			desc = "[S]earch [H]elp",
		},
		{
			"<leader>sk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "[S]earch [K]eymaps",
		},
		{
			"<leader>sp",
			function()
				Snacks.picker.pickers()
			end,
			desc = "[S]earch [P]ickers",
		},
		{
			"<leader>sd",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "[S]earch [D]iagnostics",
		},
		{
			"<leader>sr",
			function()
				Snacks.picker.resume()
			end,
			desc = "[S]earch [R]esume",
		},
		{
			"<leader><leader>",
			function()
				Snacks.picker.buffers()
			end,
			desc = "[ ] Find existing buffers",
		},
		{
			"grr",
			function()
				Snacks.picker.lsp_references()
			end,
			desc = "[G]oto [R]eferences",
		},
		{
			"gri",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "[G]oto [I]mplementations",
		},
		{
			"grd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "[G]oto [D]efinitions",
		},
		{
			"grD",
			function()
				Snacks.picker.lsp_declarations()
			end,
			desc = "[G]oto [D]eclarations",
		},
		{
			"gO",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "[G]oto [O]pen Document Symbols",
		},
		{
			"gW",
			function()
				Snacks.picker.lsp_workspace_symbols()
			end,
			desc = "[G]oto [W]orkspace Symbols",
		},
		{
			"grt",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "[G]oto [T]ype definitions",
		},
	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				-- Setup some globals for debugging (lazy-loaded)
				_G.dd = function(...)
					Snacks.debug.inspect(...)
				end
				_G.bt = function()
					Snacks.debug.backtrace()
				end

				-- Override print to use snacks for `:=` command
				if vim.fn.has("nvim-0.11") == 1 then
					---@diagnostic disable-next-line: duplicate-set-field
					vim._print = function(_, ...)
						dd(...)
					end
				else
					vim.print = _G.dd
				end

				Snacks.toggle.inlay_hints():map("<leader>th")
			end,
		})
	end,
}
