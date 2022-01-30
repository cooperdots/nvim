require("packer").use {
  -- Package info {{{
  "neovim/nvim-lspconfig";
  requires = { "folke/lua-dev.nvim", "hrsh7th/cmp-nvim-lsp" };
  -- vim:set fdm=marker fdl=0: }}}
  config = function()
    local lspconfig = require("lspconfig")
    require("ampersand.config.lsp.diagnostics")

    local servers = {
      pyright = {};
      tsserver = {};
      cssls = { cmd = { "css-languageserver", "--stdio" } };
      jsonls = { cmd = { "vscode-json-languageserver", "--stdio" } };
      html = { cmd = { "html-languageserver", "--stdio" } };
      svelte = {};
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            completion = {
              postfix = {
                enable = false
              }
            };
            lens = {
              enable = true;
              methodReferences = true;
              references = true;
            };
            diagnostics = {
              enable = true;
              disabled = {"dead-code", "dead_code"};
              enableExperimental = true;
            };
          }
        }
      };
      sumneko_lua = require("lua-dev").setup {
        lspconfig = {
          cmd = { "lua-language-server" };
          settings = {
            Lua = {
              completion = {
                workspaceWord = false;
                autoRequire = false;
              };
            };
          };
        };
      };
    }

    local function on_attach(_, _)
    end

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

    for server, config in pairs(servers) do
      lspconfig[server].setup(vim.tbl_deep_extend("force", {
        on_attach = on_attach;
        capabilities = capabilities;
        flags = {
          debounce_text_changes = 150;
        };
      }, config))
      local cfg = lspconfig[server]
      if not (cfg and cfg.cmd and vim.fn.executable(cfg.cmd[1]) == 1) then
        vim.notify(server .. ": cmd not found: " .. vim.inspect(cfg.cmd))
      end
    end
  end
}
