require("packer").use {
  -- Package info {{{
  "rcarriga/nvim-notify";
  -- vim:set fdm=marker fdl=0: }}}
  config = function()
    local notify = require("notify")
    notify.setup({
      stages = "fade_in_slide_out";

      timeout = 5000;

      background_colour = "Normal";

      icons = {
        ERROR = " ";
        WARN = " ";
        INFO = " ";
        DEBUG = " ";
        TRACE = "✎ ";
      };
    })

    vim.notify = notify
  end;
}
