require("packer").use {
  -- Package info {{{
  "norcalli/nvim-terminal.lua";
  ft = "terminal";
  -- vim:set fdm=marker fdl=0: }}}
  config = function()
    require("terminal").setup()
  end
}
