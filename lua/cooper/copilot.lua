require("packer").use {
  -- {
  --   -- Package info {{{
  --   "zbirenbaum/copilot.lua";
  --   event = "InsertEnter";
  --   -- vim:set fdm=marker fdl=0: }}}
  --   config = function()
  --     vim.schedule(function() require("copilot").setup() end)
  --   end;
  -- };
  -- {
  --   "zbirenbaum/copilot-cmp";
  --   after = {"copilot.lua"; "nvim-cmp"};
  -- }
  {
    "zbirenbaum/copilot.lua";
    event = "InsertEnter";
    config = function ()
      vim.schedule(function() require("copilot").setup() end)
    end
  };
  {
    "zbirenbaum/copilot-cmp";
    after = {"copilot.lua", "nvim-cmp"},
  }
}

-- use {
--   "zbirenbaum/copilot.lua",
--   event = "InsertEnter",
--   config = function ()
--     vim.schedule(function() require("copilot").setup() end)
--   end,
-- }
-- use {
--   "zbirenbaum/copilot-cmp",
--   after = {"copilot.lua", "nvim-cmp"},
-- }
