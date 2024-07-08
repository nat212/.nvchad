require("mason-nvim-dap").setup {
  ensure_installed = {},
  automatic_installation = true,
  handlers = {},
}

local dap = require "dap"

dap.defaults.java.console = "integratedTerminal"

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
    -- env = function()
    --   local variables = {}
    --   for k, v in pairs(vim.fn.environ()) do
    --     table.insert(variables, string.format("%s=%s", k, v))
    --   end
    --   return variables
    -- end,
  },
}
