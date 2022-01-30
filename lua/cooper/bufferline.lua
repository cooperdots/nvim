require("packer").use {
  -- Package info {{{
  "akinsho/nvim-bufferline.lua";
  requires = "kyazdani42/nvim-web-devicons";
  -- vim:set fdm=marker fdl=0: }}}
  config = function()
    local bufferline = require("bufferline")

    local icons = {error = '', warning = '', info = '', hint = ""}
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
        diagnostics = "nvim_lsp";
        always_show_bufferline = true;
        separator_style = "slant";
        diagnostics_indicator = function(_, level)
          if level == "other" then return "" end
          return ' ' .. (icons[level] or level)
        end;
      };
      highlights = {
        buffer_selected = { gui = "bold" };
        error_selected = { gui = "bold" };
        warning_selected = { gui = "bold" };
        info_selected = { gui = "bold" };

        -- buffer_visible = { gui = nil };
        -- error_visible = { gui = nil };
        -- warning_visible = { gui = nil };
        -- info_visible = { gui = nil };

        background = { gui = "italic" };
        error = { gui = "italic" };
        warning = { gui = "italic" };
        info = { gui = "italic" };

        error_diagnostic = { guifg = hls.error };
        error_diagnostic_visible = { guifg = hls.error };
        error_diagnostic_selected = { guifg = hls.error };
        warning_diagnostic = { guifg = hls.warning };
        warning_diagnostic_visible = { guifg = hls.warning };
        warning_diagnostic_selected = { guifg = hls.warning };
        info_diagnostic = { guifg = hls.info };
        info_diagnostic_visible = { guifg = hls.info };
        info_diagnostic_selected = { guifg = hls.info };

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
