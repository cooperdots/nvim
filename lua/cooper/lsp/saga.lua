require("packer").use {
  -- Package info {{{
  "glepnir/lspsaga.nvim";
  requires = "kyazdani42/nvim-web-devicons";
  -- vim:set fdm=marker fdl=0: }}}
  config = function()
    local lspsaga = require("lspsaga")

    local hover = require("lspsaga.hover")
    local signature = require("lspsaga.signaturehelp")
    local rename = require("lspsaga.rename")
    local finder = require("lspsaga.provider")

    lspsaga.init_lsp_saga {
      use_saga_diagnostic_sign = false;
      rename_prompt_prefix = ' ➤';
      code_action_icon = '  ';
      finder_definition_icon = '  ';
      finder_reference_icon = '  ';
      definition_preview_icon = '  ';
      finder_action_keys = {
        quit = {'<Esc>', '<C-c>', 'q'};
        open = {'o', '<Cr>'};
        vsplit = 'v';
        split = 's';
        scroll_down = '<C-d>';
        scroll_up = '<C-u>';
      };
      code_action_keys = {
        quit = {'<Esc>', '<C-c>', 'q'};
        exec = '<CR>'
      };
      rename_action_keys = {
        quit = {'<Esc>', '<C-c>'};
        exec = '<CR>'
      };
      code_action_prompt = {
        enable = false;
        sign = false;
        virtual_text = false
      }
    }

    require("nest").applyKeymaps {
      {"<M-j>", vim.diagnostic.goto_next};
      {"<M-k>", vim.diagnostic.goto_prev};
      {"K", hover.render_hover_doc};
      {"g", {
        {"h", "K"};
        {"r", rename.rename};
        {"s", signature.signature_help};
        {"l", finder.lsp_finder};
        {"p", finder.preview_definition};
        {"d", vim.lsp.buf.definition};
      }}
    }
  end
}
