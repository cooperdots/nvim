function Kanagawa()
  local colors = require("kanagawa.colors").setup()
  require("kanagawa").setup {
    keywordStyle = "NONE",
    variablebuiltinStyle = "NONE",
    overrides = {
      Cursor = { bg = colors.springGreen, fg = colors.bg },
      CursorIM = { bg = colors.crystalBlue },
      CursorRM = { bg = colors.autumnRed },
      CursorVM = { bg = colors.autumnYellow },
      CursorCM = { bg = colors.oniViolet },

      MatchParen = { style="none" };
      Folded = { link="TSParameter" };
      IncSearch = { link="DiffText" };
      Search = { link="Visual" };
      CopilotSuggestion = { fg = colors.fg_comment, bg = colors.bg_visual };

      UltestSummaryInfo = { link="TSFunction" };
      UltestSummaryNamespace = { link="TSConstructor" };

      QuickScopePrimary = { style="reverse" };
      QuickScopeSecondary = { style="underline" };
    }
  }
  vim.cmd [[colorscheme kanagawa]]
end

require("packer").use {
  -- Package info {{{
  "rebelot/kanagawa.nvim";
  before = "lualine.nvim";
  -- vim:set fdm=marker fdl=0: }}}
  config = Kanagawa
}
