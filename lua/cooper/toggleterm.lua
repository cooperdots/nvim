require("packer").use {
  -- Package info {{{
  "akinsho/nvim-toggleterm.lua";
  -- vim:set fdm=marker fdl=0: }}}
  config = function()
    local Terminal = require("toggleterm.terminal").Terminal

    require("toggleterm").setup({
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return 51
        end
      end;
      hide_numbers = true;
      shade_filetypes = {};
      shade_terminals = true;
      shading_factor = 1.0;
      start_in_insert = true;
      persist_size = false;
      direction = "horizontal";
    })

    local terms = {
      vert = Terminal:new { direction = "vertical" };
      horz = Terminal:new { direction = "horizontal" };
    }

    require("nest").applyKeymaps {
      {mode="t", {
        { "<M-Space>", [[<C-\><C-n>]] };
        { "<C-w>", [[<C-\><C-n><C-w>]] };
        { "<M-w>", [[<C-w>]] };
        { "<Space><Space>", function() terms.horz:toggle() end };
        { "<Leader><Leader>", function() terms.vert:toggle() end };
      }};
      { "<Space><Space>", function() terms.horz:toggle() end };
      { "<Leader><Leader>", function() terms.vert:toggle() end };
    }
  end
}
