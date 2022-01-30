require("packer").use {
  -- Package info {{{
  "ray-x/lsp_signature.nvim";
  -- vim:set fdm=marker fdl=0: }}}
  config = function()
    require("lsp_signature").setup {
      bind = true;
      max_width = 80;
      hint_enable = false;
      handler_opts = { border = "none" };
    }
  end
}
