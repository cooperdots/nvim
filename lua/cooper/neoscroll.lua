require("packer").use {
  -- Package info {{{
  "karb94/neoscroll.nvim";
  -- vim:set fdm=marker fdl=0: }}}
  config = function()
    require("neoscroll").setup {
      hide_cursor = false;
    }
  end;
}
