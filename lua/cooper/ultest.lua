require("packer").use {
  -- Package info {{{
  "rcarriga/vim-ultest";
  requires = "vim-test/vim-test";
  run = ":UpdateRemotePlugins";
  -- vim:set fdm=marker fdl=0: }}}
  config = function()
    vim.cmd [[let test#javascript#jest#options = "--color=always"]]

    vim.g.ultest_pass_sign = ""
    vim.g.ultest_fail_sign = ""
    vim.g.ultest_skip_sign = "ﮖ"
    vim.g.ultest_not_run_sign = ""
    vim.g.ultest_running_sign = "•"
    vim.g.ultest_output_on_line = false
  end;
}
