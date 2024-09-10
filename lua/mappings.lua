require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del

nomap("n", "<C-h>")
nomap("n", "<C-j>")
nomap("n", "<C-k>")
nomap("n", "<C-l>")

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
    ["L"] = { "$", { desc = "Move to end of line", noremap = true } },
    ["H"] = { "^", { desc = "Move to beginning of line", noremap = true } },
    ["$"] = { "L", { desc = "Move to end of paragraph", noremap = true } },
    ["^"] = { "H", { desc = "Move to beginning of paragraph", noremap = true } },
    ["<c-h>"] = { "<cmd>TmuxNavigateLeft<cr>", { desc = "Tmux navigate left" } },
    ["<c-j>"] = { "<cmd>TmuxNavigateDown<cr>", { desc = "Tmux navigate down" } },
    ["<c-k>"] = { "<cmd>TmuxNavigateUp<cr>", { desc = "Tmux navigate up" } },
    ["<c-l>"] = { "<cmd>TmuxNavigateRight<cr>", { desc = "Tmux navigate right" } },
    ["<c-\\>"] = { "<cmd>TmuxNavigatePrevious<cr>", { desc = "Tmux navigate previous" } },
    ["<leader>qc"] = { "<cmd>cclose<CR>", { desc = "Close quickfix window" } },
    ["<leader>qo"] = { "<cmd>copen<CR>", { desc = "Open quickfix window" } },
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
