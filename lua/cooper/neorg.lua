require("packer").use {
  -- Package info {{{
  "vhyrro/neorg";
  requires = { "nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope" };
  after = "nvim-treesitter";
  -- vim:set fdm=marker fdl=0: }}}
  config = function()
    require('neorg').setup {
      load = {
        ["core.defaults"] = {};
        ["core.norg.concealer"] = {
          config = {
            icon_preset = "basic";
          }
        };
        ["core.norg.completion"] = {
          config = {
            engine = "nvim-cmp"
          }
        };
        ["core.norg.dirman"] = {
          config = {
            workspaces = {
              main = "~/neorg";
              school = "~/neorg/school";
              gtd = "~/neorg/gtd";
            };
            autochdir = false;
            autodetect = false;
          }
        };
        ["core.integrations.telescope"] = {};
        ["core.gtd.base"] = {
          config = {
            workspace = "gtd";
          }
        };
      };
    }

    local neorg_callbacks = require('neorg.callbacks')

    neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
      keybinds.map_event_to_mode("norg", {
        n = {
          { "<C-s>", "core.integrations.telescope.find_linkable" };
        };
        i = {
          { "<C-s>", "core.integrations.telescope.insert_link" };
        }
      }, { silent = true, noremap = true })
    end)
  end
}
