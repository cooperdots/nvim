require("packer").use {
  -- Package info {{{
  "b3nj5m1n/kommentary";
  requires = "JoosepAlviste/nvim-ts-context-commentstring";
  opt = true;
  keys = { "gc", "gcc" };
  -- vim:set fdm=marker fdl=0: }}}
  config = function()
    require('kommentary.config').configure_language("default", {
      prefer_single_line_comments = true;
    })
  end;
}
