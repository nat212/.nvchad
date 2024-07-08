require "nvchad.mappings"
local map = vim.keymap.set

---@type MappingsTable
local mappings = {
  n = {
    [";"] = { ":", opts = { desc = "enter command mode", nowait = true } },
    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      opts = { desc = "format code" },
    },
    ["<C-h>"] = { "<cmd><C-U>TmuxNavigateLeft<cr>", { desc = "Navigate left" } },
    ["<C-l>"] = { "<Right>", { desc = "Move right" } },
    ["<C-j>"] = { "<cmd><C-U>TmuxNavigateDown<cr>", { desc = "Navigate down" } },
    ["<C-k>"] = { "<cmd><C-U>TmuxNavigateUp<cr>", { desc = "Move up" } },
    ["L"] = { "$", { desc = "Move to end of line", noremap = true } },
    ["H"] = { "^", { desc = "Move to beginning of line", noremap = true } },
    ["$"] = { "L", { desc = "Move to end of paragraph", noremap = true } },
    ["^"] = { "H", { desc = "Move to beginning of paragraph", noremap = true } },
  },
  v = {
    [">"] = { ">gv", { desc = "indent" } },
    ["L"] = { "$", { desc = "Move to end of line", noremap = true } },
    ["H"] = { "^", { desc = "Move to beginning of line", noremap = true } },
    ["$"] = { "L", { desc = "Move to end of paragraph", noremap = true } },
    ["^"] = { "H", { desc = "Move to beginning of paragraph", noremap = true } },
  },
  x = {
    ["L"] = { "$", { desc = "Move to end of line", noremap = true } },
    ["H"] = { "^", { desc = "Move to beginning of line", noremap = true } },
    ["$"] = { "L", { desc = "Move to end of paragraph", noremap = true } },
    ["^"] = { "H", { desc = "Move to beginning of paragraph", noremap = true } },
  },
  o = {
    ["L"] = { "$", { desc = "Move to end of line", noremap = true } },
    ["H"] = { "^", { desc = "Move to beginning of line", noremap = true } },
    ["$"] = { "L", { desc = "Move to end of paragraph", noremap = true } },
    ["^"] = { "H", { desc = "Move to beginning of paragraph", noremap = true } },
  },
}

for mode, maps in pairs(mappings) do
  for key, val in pairs(maps) do
    map(mode, key, val[1], val[2])
  end
end
