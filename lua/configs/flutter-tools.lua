local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

require("flutter-tools").setup {
  lsp = {
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = function(fname)
      return require("lspconfig").util.root_pattern("pubspec.yaml", "pubspec.yml", "pubspec.lock", ".git")(fname)
        or vim.fn.getcwd()
    end,
    color = {
      enabled = true,
      background = true,
      virtual_text = true,
    },
    settings = {
      showTodos = true,
      completeFunctionCalls = true,
      renameFilesWithClasses = "prompt",
      enableSnippts = true,
    },
  },
  ui = {
    notification_style = "native",
    border = "rounded",
  },
  dev_log = {
    enabled = false,
  },
  widget_guides = {
    enabled = true,
  },
  dev_tools = {
    autostart = true,
  },
  decorations = {
    statusline = {
      device = true,
    },
  },
  debugger = {
    enabled = true,
    run_via_dap = true,
    exception_breakpoints = {},
    register_configurations = function(paths)
      require("dap.ext.vscode").load_launchjs()
    end,
  },
}
