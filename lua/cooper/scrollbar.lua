require("packer").use {
  -- Package info {{{
  "petertriho/nvim-scrollbar";
  -- vim:set fdm=marker fdl=0: }}}
  config = function()
    require("scrollbar").setup {
      marks = {
        Search = {
          highlight = "diffChanged"
        }
      }
    }
    require("scrollbar.handlers.search").setup {}
  end;
}
