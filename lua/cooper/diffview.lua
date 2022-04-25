require("packer").use {
  -- Package info {{{
  "sindrets/diffview.nvim";
  -- vim:set fdm=marker fdl=0: }}}
  config = function()
    local diffview = require("diffview")
    local cb = require("diffview.config").diffview_callback

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
      key_bindings = {
        view = {
          ["<C-j>"] = cb("select_next_entry");
          ["<C-k>"] = cb("select_prev_entry");
        };
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
