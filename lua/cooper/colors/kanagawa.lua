require("packer").use {
  -- Package info {{{
  "rebelot/kanagawa.nvim";
  -- vim:set fdm=marker fdl=0: }}}
  config = function()
    local colors = require("kanagawa.colors").setup()
    require("kanagawa").setup {
      overrides = {
        Cursor = { bg = colors.springGreen, fg = colors.bg },
        CursorIM = { bg = colors.crystalBlue },
        CursorRM = { bg = colors.autumnRed },
        CursorVM = { bg = colors.autumnYellow },
        CursorCM = { bg = colors.oniViolet },

        MatchParen = { style="none" };
        Folded = { link="TSParameter" };
        IndentBlanklineContextStart = { style="none" };
        CopilotSuggestion = { fg = colors.fg_comment, bg = colors.bg_visual };
      }
    }
  end
}
