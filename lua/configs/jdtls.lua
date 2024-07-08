local function attach_jdtls()
  local on_attach = require("nvchad.configs.lspconfig").on_attach
  local capabilities = require("nvchad.configs.lspconfig").capabilities

  local script
  local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
  if vim.loop.os_uname().sysname == "Darwin" then
    script = vim.fn.glob "~/.config/nvim/lua/custom/scripts/jdtls.sh"
  end
  local cmd = { script, project_name }

  local config = {
    cmd = cmd,
    root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw", "pom.xml" }, { upward = true })[1]),
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = {
      bundles = {
        vim.fn.glob(
          "$HOME/development/tools/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar",
          1
        ),
      },
    },
  }

  require("jdtls").start_or_attach(config)
  require("jdtls.dap").setup_dap_main_class_configs()
  require("dap.ext.vscode").load_launchjs()
end

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = "*.java,application*.yaml,application*.yml,*.properties",
  callback = attach_jdtls,
})
