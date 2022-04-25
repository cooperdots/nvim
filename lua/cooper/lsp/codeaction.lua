require("packer").use {
  -- Package info {{{
  "weilbith/nvim-code-action-menu";
  -- vim:set fdm=marker fdl=0: }}}
  config = function()
    vim.api.nvim_set_keymap("n", "<M-Return>", "<cmd>CodeActionMenu<CR>", {
      silent=true, noremap=true
    })
  end;
}
