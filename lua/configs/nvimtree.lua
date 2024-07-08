local M = {}

local function close_nvimtree()
  require("nvim-tree.api").tree.close()
end

local function setup_autocmds()
  vim.api.nvim_create_augroup("nvimtree_exit_on_quit", { clear = true })
  vim.api.nvim_create_autocmd("QuitPre", {
    group = "nvimtree_exit_on_quit",
    callback = close_nvimtree,
  })
end

M.setup = function(opts)
  dofile(vim.g.base46_cache .. "nvimtree")
  require("nvim-tree").setup(opts)
  setup_autocmds()
end

return M
