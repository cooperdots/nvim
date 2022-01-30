require("packer").use {
  -- Package info {{{
  "gelguy/wilder.nvim";
  run = ":UpdateRemotePlugins";
  -- vim:set fdm=marker fdl=0: }}}
  config = function()
    vim.cmd [[call wilder#setup({'modes': [':']})]]
    vim.cmd [[
    call wilder#set_option('renderer', wilder#popupmenu_renderer({
      \ 'highlighter': wilder#basic_highlighter(),
      \ 'left': [' ', wilder#popupmenu_devicons(),],
      \ 'right': [' ', wilder#popupmenu_scrollbar(),],
      \ }))
    ]]
  end;
}
