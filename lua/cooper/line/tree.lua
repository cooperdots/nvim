-- Color table for highlights
local colors = {
  bg = '#17191a';
  fg = '#bbc2cf';
  blue = "#7daea3";
  cyan = "#89b482";
  purple = "#d3869b";
  orange = "#e78a4e";
  yellow = "#d8a657";
  green = "#a9b665";
  magenta = '#d3869b';
  red = '#ea6962';
  violet = '#a9a1e1';
}

local config = {
  sections = {
    lualine_c = {};
    lualine_x = {};
  };
  filetypes = { "NvimTree" };
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
  function() return '▊' end;
  color = {fg = colors.magenta}, -- Sets highlighting of component
  left_padding = 0 -- We don't need space before this
}

ins_left {
  function() return '' end;
  color = {fg = colors.green};
}

ins_left {
  function() return vim.fn.fnamemodify(vim.fn.getcwd(), ':~') end;
}

ins_right {
  function() return '▊' end;
  color = {fg = colors.magenta};
  right_padding = 0
}

return config
