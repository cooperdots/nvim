local opt = vim.opt

-- Appearance options {{{
opt.number = true
opt.relativenumber = true
opt.foldmethod = "manual"
opt.foldlevelstart = 1
opt.lazyredraw = true
vim.opt.guifont = [[Hack\ Nerd\ Font:h12]]
local a = "n-sm:block-Cursor,"
local b = "i-ci:ver25-CursorIM,"
local c = "r-cr:hor20-CursorRM,"
local d = "v-ve:block-CursorVM,"
local e = "c-o:block-CursorCM,"
opt.guicursor = a .. b .. c .. d .. e
-- }}}

-- Information options {{{
-- opt.colorcolumn = 80
opt.signcolumn = "yes:1"
opt.showmode = false
opt.showcmd = true
opt.ruler = false
opt.shortmess = vim.api.nvim_get_option("shortmess") .. "c"
opt.undofile = true
opt.swapfile = false
-- }}}

-- Window/buffer options {{{
opt.laststatus = 3
opt.showtabline = 2
opt.hidden = true
opt.splitbelow = true
opt.splitright = true
opt.visualbell = true
opt.gdefault = true
-- }}}

-- Text options {{{
opt.scrolloff = 99
opt.wrap = false
opt.listchars.tab = [[🭰\ ]]
opt.listchars.trail = [[▓]]
opt.fillchars.fold = [[\ ]]
opt.fillchars.eob = [[\ ]]
opt.list = true
opt.conceallevel = 2
opt.formatoptions = "jql"
opt.clipboard = "unnamedplus"
opt.inccommand = "nosplit"
vim.cmd("autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()")
-- }}}

-- Movement options {{{
opt.whichwrap = opt.whichwrap + "<,>,h,l,[,]"
-- }}}

-- Indenting options {{{
opt.autoindent = true
opt.smartindent = true
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.shiftround = true
-- }}}

-- PUM options {{{
opt.pumheight = 16
opt.pumblend = 5
opt.winblend = 15
-- }}}

-- Search options {{{
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.completeopt = "menuone,noselect"
-- }}}

-- Timing options {{{
opt.timeoutlen = 1000
opt.ttimeoutlen = 0
opt.updatetime = 1
-- }}}

-- Color options {{{
opt.termguicolors = true
vim.cmd("syntax on")
-- }}}

-- vim: fdm=marker fdl=0:
