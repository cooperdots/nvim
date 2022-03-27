require("packer").use {
  -- Package info {{{
  "kevinhwang91/nvim-hlslens";
  -- vim:set fdm=marker fdl=0: }}}
  config = function()
    require("nest").applyKeymaps {
      { "<Space>/", "<Cmd>nohl<CR>" }
    }
  end;
}
