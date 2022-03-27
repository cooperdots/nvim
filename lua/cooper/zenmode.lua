require("packer").use {
  -- Package info {{{
  "folke/zen-mode.nvim";
  -- vim:set fdm=marker fdl=0: }}}
  config = function()
    require("zen-mode").setup {
      window = {
        backdrop = 0.8;
        height = 0.9;
        width = 100;
      };
      plugins = {
        options = {
          showcmd = false;
        };
      };
    }
  end;
}
