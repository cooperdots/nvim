require("packer").use {
  -- Package info {{{
  "mhartington/formatter.nvim";
  -- vim:set fdm=marker fdl=0: }}}
  config = function()
    local function prettier()
      return {
        exe = "prettierd",
        args = {vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
        stdin = true
      }
    end
    require("formatter").setup {
      filetype = {
        typescriptreact = { prettier };
        typescript = { prettier };
        svelte = { prettier };
        markdown = { prettier };
        html = { prettier };
        css = { prettier };
        python = {
          function()
            return {
              exe = "black";
              args = {"-"};
              stdin = true
            }
          end;
        };
      }
    }

    vim.api.nvim_exec([[
    augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.ts,*.svelte,*.html,*.css FormatWrite
    augroup END
    ]], true)

    require("nest").applyKeymaps {
      {mode="v", {
        {"iF", "<esc>ggVG"};
        {"<Space>=", ":Format<CR>", opts = {silent = true}};
      }};
      {"<Space>=", "<cmd>Format<CR>"};
    }
  end
}
