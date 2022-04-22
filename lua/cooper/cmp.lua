require("packer").use {
  -- Package info {{{
  "hrsh7th/nvim-cmp";
  requires = {
    "onsails/lspkind-nvim";
    "hrsh7th/vim-vsnip";
    "hrsh7th/cmp-vsnip";
    "hrsh7th/cmp-nvim-lsp";
    "hrsh7th/cmp-nvim-lsp-signature-help";
    "hrsh7th/cmp-path";
    "kdheepak/cmp-latex-symbols";
    "hrsh7th/cmp-emoji";
    "lukas-reineke/cmp-under-comparator";
    "hrsh7th/cmp-cmdline";
  };
  -- vim:set fdm=marker fdl=0: }}}
  config = function()
    require("cooper.lsp.kind")
    local cmp = require("cmp")
    local lspkind = require("lspkind")

    local config = {
      completion = {
        completeopt = "menu,menuone,noinsert";
      };
      formatting = {
        -- fields = {"kind", "abbr", "menu"};
        format = lspkind.cmp_format(require("cooper.lsp.kind"))
      };
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end;
      };
      mapping = cmp.mapping.preset.insert {
        ["<C-d>"] = cmp.mapping.scroll_docs(-4);
        ["<C-f>"] = cmp.mapping.scroll_docs(4);
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select });
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select });
        ["<C-Space>"] = cmp.mapping.complete();
        ["<C-e>"] = cmp.mapping.close();
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace;
          select = true;
        })
      };
      sources = {
        { name = "copilot" };
        { name = "vsnip" };
        { name = "nvim_lsp" };
        { name = "nvim_lsp_signature_help" };
        { name = "path" };
        { name = "neorg" };
        { name = "latex_symbols" };
        { name = "emoji" };
      };
      sorting = {
        comparators = {
          cmp.config.compare.offset;
          cmp.config.compare.exact;
          cmp.config.compare.score;
          require "cmp-under-comparator".under;
          cmp.config.compare.kind;
          cmp.config.compare.sort_text;
          cmp.config.compare.length;
          cmp.config.compare.order;
        };
      };
    }
    cmp.setup(config)
    cmp.setup.cmdline(":", {
      sources = {
        { name = "cmdline" }
      };
      mapping = cmp.mapping.preset.cmdline {
        ["<CR>"] = cmp.mapping.confirm({ select = true; });
      }
    })
  end
}
