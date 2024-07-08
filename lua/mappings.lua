require "nvchad.mappings"
---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

local navigation_overrides = {
  ["L"] = { "$", opts = { noremap = true } },
  ["H"] = { "^", opts = { noremap = true } },
  ["$"] = { "L", opts = { noremap = true } },
  ["^"] = { "H", opts = { noremap = true } },
}

M.navigation = {
  n = navigation_overrides,
  x = navigation_overrides,
  o = navigation_overrides,
  v = navigation_overrides,
}

M.disabled = {
  n = {
    -- These are handled by tmux navigator
    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
  },
}

-- M.navigation = {
--   n = {
--     ["<C-h>"] = { "<cmd><C-U>TmuxNavigateLeft<cr>", "Navigate left" },
--     ["<C-l>"] = { "<Right>", "Move right" },
--     ["<C-j>"] = { "<cmd><C-U>TmuxNavigateDown<cr>", "Navigate down" },
--     ["<C-k>"] = { "<cmd><C-U>TmuxNavigateUp<cr>", "Move up" },
--   }
-- }

-- more keybinds!

return M
