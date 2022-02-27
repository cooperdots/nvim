local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
-- local packer_bootstrap = nil
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

vim.cmd [[packadd packer.nvim]]
local packer = require("packer")
local use = packer.use

--[[require("nest").applyKeymaps({
  { "<Space>P", {
    { "I", packer.install };
    { "C", packer.compile };
    { "U", packer.update };
    { "X", packer.clean };
    { "S", packer.sync };
  }}
})--]]

vim.cmd("autocmd BufWritePost */nvim/lua/* PackerCompile")

return packer.startup {
  function()
    use {"wbthomason/packer.nvim", opt = true}
    use "LionC/nest.nvim"

    require("cooper.lsp")
    require("cooper.lsp.saga")
    require("cooper.lsp.signature")
    require("cooper.lsp.codeaction")
    require("cooper.treesitter")

    require("cooper.cmp")
    require("cooper.vsnip")
    require("cooper.lint")
    require("cooper.formatter")
    require("cooper.autopairs")
    require("cooper.kommentary")
    require("cooper.indent")

    require("cooper.gitsigns")
    require("cooper.diffview")

    require("cooper.telescope")
    require("cooper.bufferline")
    require("cooper.lualine")
    require("cooper.tree")

    require("cooper.terminal")
    require("cooper.toggleterm")
    require("cooper.ultest")

    require("cooper.neorg")
    require("cooper.markdownpreview")

    require("cooper.wilder")
    require("cooper.notify")
    require("cooper.zenmode")
    require("cooper.cheatsheet")

    require("cooper.colors.kanagawa")

    use "psliwka/vim-smoothie"
    use "machakann/vim-sandwich"
    use "evanleck/vim-svelte"
    use "github/copilot.vim"
    use "jbyuki/nabla.nvim"

    if packer_bootsrap then
	    packer.sync()
    end
  end;
  -- Packer config {{{
  -- Setup profile and modify symbols
  config = {
    profile = {
      enable = true;
      threshold = 0;
    };
    display = {
      error_sym = "";
      done_sym = "";
      -- open_fn = function()
      --   return require("packer.util").float({ border = "single" })
      -- end;
    };
  }
  -- vim:set fdm=marker fdl=0: }}}
}
