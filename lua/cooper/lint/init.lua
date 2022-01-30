require("packer").use {
  -- Package info {{{
  "mfussenegger/nvim-lint";
  -- vim:set fdm=marker fdl=0: }}}
  config = function()
    local lint = require("lint")

    lint.linters.pylint_stdin = require("cooper.lint.pylint")

    lint.linters_by_ft = {
      python = {"pylint_stdin"};
    }

    require("nest").applyKeymaps {
      {"<Space>?", lint.try_lint}
    }
  end
}
