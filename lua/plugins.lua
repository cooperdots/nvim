vim.cmd [[packadd packer.nvim]]
local packer = require("packer")
local use = packer.use

require("nest").applyKeymaps({
  { "<Space>P", {
    { "I", packer.install };
    { "C", packer.compile };
    { "U", packer.update };
    { "X", packer.clean };
    { "S", packer.sync };
  }}
})

-- vim.cmd("autocmd BufWritePost */nvim/lua/* PackerCompile")

return packer.startup {
  function()
    use {"wbthomason/packer.nvim", opt = true}
    use "LionC/nest.nvim"
    require("cooper.lsp")
    require("cooper.cmp")
    require("cooper.treesitter")
    require("cooper.telescope")
    require("cooper.gitsigns")
    require("cooper.bufferline")
    require("cooper.lualine")
    require("cooper.lsp.saga")

    use "psliwka/vim-smoothie"
    use "machakann/vim-sandwich"
    use "evanleck/vim-svelte"
    use "github/copilot.vim"
    use "jbyuki/nabla.nvim"
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
