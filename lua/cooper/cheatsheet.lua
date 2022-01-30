require("packer").use {
  -- Package info {{{
  "sudormrfbin/cheatsheet.nvim";
  requires = {
    "nvim-telescope/telescope.nvim";
    "nvim-lua/popup.nvim";
    "nvim-lua/plenary.nvim";
  }
  -- vim:set fdm=marker fdl=0: }}}
}
