require("packer").use {
  -- Package info {{{
  "iamcco/markdown-preview.nvim";
  run = "cd app && yarn install";
  -- vim:set fdm=marker fdl=0: }}}
  config = function()
    vim.g.mkdp_auto_close = 0
  end
}
