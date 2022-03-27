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

    require("nest").applyKeymaps {
      { "<Space>R", "<Plug>(ultest-run-file)" };
      { "<Space>r", "<Plug>(ultest-run-nearest)" };
      { "<Space>s", "<Plug>(ultest-summary-jump)" };
      { "<Space>o", "<Plug>(ultest-output-show)" };
      { "[f", "<Plug>(ultest-prev-fail)" };
      { "]f", "<Plug>(ultest-next-fail)" };
    }
  end;
}
