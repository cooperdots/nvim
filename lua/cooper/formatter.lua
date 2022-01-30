require("packer").use {
  -- Package info {{{
  "mhartington/formatter.nvim";
  -- vim:set fdm=marker fdl=0: }}}
  config = function()
    require("formatter").setup {
      filetype = {
        typescriptreact = {
          function()
            return {
              exe = "prettier";
              args = {"-w"};
              stdin = false;
            }
          end
        };
        markdown = {
          function()
            return {
              exe = "prettier";
              args = {"-w"};
              stdin = false;
            }
          end
        };
        python = {
          function()
            return {
              exe = "black";
              args = {"-"};
              stdin = true
            }
          end;
        };
      }
    }

    require("nest").applyKeymaps {
      {mode="v", {
        {"iF", "<esc>ggVG"};
        {"<Space>=", ":Format<CR>", opts = {silent = true}};
      }};
      {"<Space>=", "<cmd>Format<CR>"};
    }
  end
}
