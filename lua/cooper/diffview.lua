require("packer").use {
  -- Package info {{{
  "sindrets/diffview.nvim";
  -- vim:set fdm=marker fdl=0: }}}
  config = function()
    local diffview = require("diffview")

    vim.opt.fillchars:append({diff = " "})
    diffview.setup {
      file_panel = {
        width = 30;
      };
      icons = {
        folder_closed = "";
        folder_open = "";
      };
      signs = {
        fold_closed = "▶";
        fold_open = "▼";
      };
    }

    local open = false

    require("nest").applyKeymaps {
      { "<Space>g", function()
        open = not open
        if open then
          diffview.open()
        else
          diffview.close()
        end
      end }
    }
  end
}
