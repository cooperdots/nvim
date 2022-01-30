require("packer").use {
  -- Package info {{{
  "nvim-treesitter/nvim-treesitter";
  run = ":TSUpdate";
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
      };
      highlight = { enable = true, use_languagetree = true };
      indent = { enable = false };
      context_commentstring = { enable = true };
      query_linter = {
        enable = true;
        use_virtual_text = true;
        lint_events = { "BufWrite", "CursorHold" };
      };
      autopairs = { enable = true };
      playground = { enable = true };
    }
  end
}
