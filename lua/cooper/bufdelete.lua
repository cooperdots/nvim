require("packer").use {
  -- Package info {{{
  "famiu/bufdelete.nvim";
  -- vim:set fdm=marker fdl=0: }}}
  config = function ()
    local bufdelete = require("bufdelete")
    require("nest").applyKeymaps({
      {"<C-w>b", function() bufdelete.bufdelete(0, true) end}
    })
  end;
}
