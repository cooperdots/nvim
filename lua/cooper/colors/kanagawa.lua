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

      TSURI = { link="TSFunction" };
      MatchParen = { style="none" };
      TSParameter = { link = "Constant" };
      Folded = { link="TSProperty" };
      IncSearch = { link="DiffText" };
      Search = { link="Visual" };
      CopilotSuggestion = { fg = colors.fg_comment, bg = colors.bg_visual };

      TelescopeResultsDiffAdd = { link="GitSignsAdd" };
      TelescopeResultsDiffChange = { link="GitSignsChange" };
      TelescopeResultsDiffDelete = { link="GitSignsDelete" };

      NvimTreeFolderName = { fg = "None" };
      NvimTreeOpenedFolderName = { link="NvimTreeFolderName" };
      NvimTreeRootFolder = { fg=colors.oniViolet, style="none" };

      UltestSummaryInfo = { link="TSFunction" };
      UltestSummaryNamespace = { link="TSConstructor" };

      QuickScopePrimary = { style="reverse" };
      QuickScopeSecondary = { style="underline" };

      TabiIndent = { bg=colors.springGreen, fg=colors.bg };
    }
  }
  vim.cmd [[colorscheme kanagawa]]
end

require("packer").use {
  -- Package info {{{
  "rebelot/kanagawa.nvim";
  before = "lualine.nvim";
  -- vim:set fdm=marker fdl=0: }}}
  config = function()
    vim.opt.fillchars:append {
      horiz = ' ',
      horizup = ' ',
      horizdown = ' ',

      vert = ' ',
      vertleft = ' ',

      vertright = ' ',
      verthoriz = ' ',

      fold = ' ',
      foldopen = '┌',
      foldclose = '╶',
    }

    Kanagawa()
  end
}
