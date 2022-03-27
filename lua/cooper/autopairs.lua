require("packer").use {
  -- Package info {{{
  "windwp/nvim-autopairs";
  -- vim:set fdm=marker fdl=0: }}}
  config = function()
    require("nvim-autopairs").setup { check_ts = true }
  end
}
