require("packer").use {
  -- Package info {{{
  "akinsho/nvim-bufferline.lua";
  requires = "kyazdani42/nvim-web-devicons";
  -- vim:set fdm=marker fdl=0: }}}
  config = function()
    local bufferline = require("bufferline")

    local hls = {
      error = '#ec5f67';
      warning = '#ecbe7b';
      info = '#1abc9c';
      hint = '#008080';
      grey = "#565f89";
    }

    bufferline.setup {
      options = {
        modified_icon = '●';
        show_close_icon = false;
        show_buffer_close_icons = false;
        always_show_bufferline = true;
      };
      highlights = {
        buffer_selected = { gui = "bold" };
        error_selected = { gui = "bold" };
        warning_selected = { gui = "bold" };
        info_selected = { gui = "bold" };

        pick_selected = { gui = "italic", guifg = hls.grey };
        pick_visible = { gui = nil, guifg = hls.warning };
        pick = { gui = "bold", guifg = hls.error };

        modified_selected = { guifg = hls.grey };
        modified_visible = { guifg = hls.grey };
        modified = { guifg = hls.warning };
      }
    }

    require("nest").applyKeymaps {
      {"<C-j>", function() bufferline.cycle(-1) end};
      {"<C-k>", function() bufferline.cycle(1) end};
      {"<M-Space>", bufferline.pick_buffer};
      {"<Tab>", bufferline.pick_buffer};
    }
  end
}
