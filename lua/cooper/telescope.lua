require("packer").use {
  -- Package info {{{
  "nvim-telescope/telescope.nvim";
  -- opt = true;
  -- cmd = { "Telescope" };
  -- keys = { "<Leader><Space>", "<Space>f" };
  requires = {
    "nvim-lua/popup.nvim";
    "nvim-lua/plenary.nvim";
    "nvim-telescope/telescope-fzy-native.nvim";
  };
  -- vim:set fdm=marker fdl=0: }}}
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")
    local actions = require("telescope.actions")
    local previewers = require("telescope.previewers")

    telescope.setup {
      defaults = {
        winblend = 15;
        file_ignore_patterns = {
          "node_modules/*", "\\.git/*", "target/*";
          "%.png", "%.ico", "%.jpg", "%.icns", "%.map", "%.out";
          "CuTest.c", "CuTest.h"
        };
        file_previewer = previewers.vim_buffer_cat.new;
        grep_previewer = previewers.vim_buffer_vimgrep.new;
        qflist_previewer = previewers.vim_buffer_qflist.new;
        show_line = false;
        selection_caret = "╶‣ ";
        entry_prefix = "   ";
        prompt_prefix = '    ';

        mappings = {
          i = {
            ["<C-q>"] = actions.send_to_qflist;
            ["<Esc>"] = actions.close;
          }
        }
      };
      extensions = {
        fzy_native = {
          override_generic_sorter = false;
          override_file_sorter = true;
        }
      }
    }

    telescope.load_extension("fzy_native")

    local settings = {prompt_title="", results_title="", preview_title=""}
    require("nest").applyKeymaps {
      {"<Space>", {
        {"f", function() builtin.git_files(settings) end}
      }};
      {"<Leader>", {
        {"<Space>", {
          {"f", function() builtin.find_files(settings) end};
          {"l", builtin.live_grep};
        }}
      }}
    }
  end
}
