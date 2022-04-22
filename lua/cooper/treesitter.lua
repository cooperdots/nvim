require("packer").use {
  -- Package info {{{
  "nvim-treesitter/nvim-treesitter";
  run = ":TSUpdate";
  before = "neorg";
  requires = {
    { "nvim-treesitter/playground"; cmd = {
      "TSHighlightCapturesUnderCursor";
      "TSPlaygroundToggle";
    }};
    "nvim-treesitter/nvim-treesitter-textobjects";
  };
  -- vim:set fdm=marker fdl=0: }}}
  config = function()
    local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

    parser_configs.norg = {
      install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg";
        files = { "src/parser.c", "src/scanner.cc" };
        branch = "main"
      };
    }
    parser_configs.norg_meta = {
      install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
        files = { "src/parser.c" },
        branch = "main"
      },
    }
    parser_configs.norg_table = {
      install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
        files = { "src/parser.c" },
        branch = "main"
      },
    }

    require("nvim-treesitter.configs").setup {
      ensure_installed = {
        "c";
        "comment";
        "cpp";
        "css";
        "fish";
        "html";
        "javascript";
        "jsonc";
        "latex";
        -- "lua";
        "python";
        "regex";
        "rust";
        "toml";
        "tsx";
        "typescript";
        "yaml";
        "json";
        "norg";
        "norg_meta";
        "norg_table";
      };
      highlight = { enable = true, use_languagetree = true };
      indent = { enable = true };
      context_commentstring = { enable = true };
      query_linter = {
        enable = true;
        use_virtual_text = true;
        lint_events = { "BufWrite", "CursorHold" };
      };
      autopairs = { enable = true };
      playground = { enable = true };
      textobjects = {
        select = {
          enable = true;
          lookahead = true;
          keymaps = {
            ["af"] = "@function.outer";
            ["if"] = "@function.inner";
            ["ac"] = "@class.outer";
            ["ic"] = "@class.inner";
          };
        };
      };
    }
  end
}
