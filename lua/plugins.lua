vim.cmd [[packadd packer.nvim]]
local packer = require("packer")
local use = packer.use

vim.cmd("autocmd BufWritePost */nvim/lua/* PackerCompile")

return packer.startup {
  function()
    use {"wbthomason/packer.nvim", opt = false}
    -- Nest config {{{
    use {"LionC/nest.nvim", config = function ()
      local p = require("packer")
      require("nest").applyKeymaps {
        { "<Space>P", {
          { "I", p.install };
          { "C", p.compile };
          { "U", p.update };
          { "X", p.clean };
          { "S", p.sync };
        }};
        { mode = "i", {
          {"<C-h>", "<Left>"};
          {"<C-j>", "<Down>"};
          {"<C-k>", "<Up>"};
          {"<C-l>", "<Right>"};
        }};
      }
    end} --}}}

    require("cooper.lsp")
    require("cooper.lsp.saga")
    require("cooper.lsp.codeaction")
    require("cooper.treesitter")

    require("cooper.cmp")
    require("cooper.vsnip")
    require("cooper.lint")
    require("cooper.formatter")
    require("cooper.autopairs")
    require("cooper.kommentary")
    require("cooper.indent")
    require("cooper.copilot")

    require("cooper.gitsigns")
    require("cooper.diffview")

    require("cooper.telescope")
    require("cooper.bufferline")
    require("cooper.lualine")
    require("cooper.tree")

    require("cooper.terminal")
    require("cooper.toggleterm")
    require("cooper.ultest")

    require("cooper.neorg")
    require("cooper.markdownpreview")

    require("cooper.notify")
    require("cooper.zenmode")
    require("cooper.cheatsheet")

    require("cooper.neoscroll")
    require("cooper.scrollbar")
    require("cooper.hlslens")
    require("cooper.bufdelete")

    require("cooper.colors.kanagawa")

    use "machakann/vim-sandwich"
    use "evanleck/vim-svelte"
    use "jbyuki/nabla.nvim"

    use {"unblevable/quick-scope", config = function()
      vim.g.qs_highlight_on_keys = {"f", "F", "t", "T"}
    end}

    use {"m-demare/hlargs.nvim", config = function()
      require("hlargs").setup()
      vim.cmd [[autocmd ColorScheme * hi! link Hlargs TSParameterReference]]
    end}
  end;
  -- Packer config {{{
  -- Setup profile and modify symbols
  config = {
    profile = {
      enable = true;
      threshold = 0;
    };
    display = {
      error_sym = "???";
      done_sym = "???";
    };
  }
  -- vim:set fdm=marker fdl=0: }}}
}
