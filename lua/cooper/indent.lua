require("packer").use {
  -- Package info {{{
  "lukas-reineke/indent-blankline.nvim";
  -- vim:set fdm=marker fdl=0: }}}
  config = function()
    require("indent_blankline").setup {
      char = "┆";
      show_current_context = true;
      show_current_context_start = true;
      show_trailing_blankline_indent = false;
      filetype_exclude = { "norg", "man", "NvimTree" }
    }
  end
}
