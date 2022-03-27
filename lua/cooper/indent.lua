require("packer").use {
  -- Package info {{{
  "lukas-reineke/indent-blankline.nvim";
  -- vim:set fdm=marker fdl=0: }}}
  config = function()
    require("indent_blankline").setup {
      char = "┆";
      char_blankline = "│";
      show_foldtext = false;
      max_indent_increase = 2;
      show_current_context = true;
      show_current_context_start = false;
      show_trailing_blankline_indent = false;
      filetype_exclude = {
        "terminal"; "toggleterm";
        "norg";
        "man";
        "NvimTree";
        "TelescopePrompt";
        "help";
        "packer";
        "UltestSummary"; "UltestOutput";
      }
    }
  end
}
