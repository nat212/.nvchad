local overrides = require "configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("neoconf").setup()
      require "nvchad.configs.lspconfig"
      require "configs.lspconfig"
    end, -- Override to setup mason-lspconfig
    dependencies = {
      "folke/neoconf.nvim",
    },
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
    config = function(_, opts)
      require("configs.nvimtree").setup(opts)
    end,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    -- event = "BufWritePre"
    config = function()
      require "configs.conform"
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>", desc = "Tmux navigate left" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>", desc = "Tmux navigate down" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>", desc = "Tmux navigate up" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>", desc = "Tmux navigate right" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>", desc = "Tmux navigate previous" },
    },
    lazy = false,
  },

  {
    "stevearc/dressing.nvim",
    opts = {
      select = {
        enabled = true,
        builtin = {
          relative = "cursor",
          start_in_insert = true,
          win_options = {
            winblend = 0,
          },
        },
      },
      input = {
        win_options = {
          winblend = 0,
        },
      },
    },
    lazy = false,
  },

  {
    "j-hui/fidget.nvim",
    lazy = false,
  },

  { "tpope/vim-surround", lazy = false },

  {
    "folke/twilight.nvim",
    cmd = {
      "Twilight",
      "TwilightEnable",
      "TwilightDisable",
    },
    opts = {},
  },

  {
    "folke/zen-mode.nvim",
    cmd = {
      "ZenMode",
    },
    keys = {
      {
        "<leader>z",
        function()
          require("zen-mode").toggle { window = { width = 0.85 } }
        end,
      },
    },
  },

  {
    "nvim-java/nvim-java",
    dependencies = {
      "nvim-java/lua-async-await",
      "nvim-java/nvim-java-refactor",
      "nvim-java/nvim-java-core",
      "nvim-java/nvim-java-test",
      "nvim-java/nvim-java-dap",
      "MunifTanjim/nui.nvim",
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      {
        "williamboman/mason.nvim",
        opts = {
          registries = {
            "github:nvim-java/mason-registry",
            "github:mason-org/mason-registry",
          },
        },
      },
    },
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
  },

  {
    "folke/neoconf.nvim",
    cmd = {
      "Neoconf",
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      registries = {
        "github:nvim-java/mason-registry",
        "github:mason-org/mason-registry",
      },
    },
  },

  {
    "mfussenegger/nvim-dap",
    keys = {
      {
        "<leader>ds",
        function()
          require("dap").close()
        end,
        desc = "Stop debugging",
      },
      {
        "<F5>",
        function()
          require("dap").continue()
        end,
        desc = "Start/continue debugging",
      },
      {
        "<F10>",
        function()
          require("dap").step_over()
        end,
        desc = "Step over",
      },
      {
        "<F11>",
        function()
          require("dap").step_into()
        end,
        desc = "Step into",
      },
      {
        "<F12>",
        function()
          require("dap").step_out()
        end,
        desc = "Step out",
      },
      {
        "<leader>de",
        function()
          require("dap").set_exception_breakpoints()
        end,
        desc = "Set exception breakpoints",
      },
      {
        "<leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle breakpoint",
      },
    },
    cmd = {
      "DapContinue",
      "DapLoadLaunchJSON",
      "DapToggleBreakpoint",
    },
    config = function()
      require "configs.dap"
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    event = "User BufReadPost",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require("configs.dap-ui").setup()
    end,
    keys = {
      {
        "<leader>dq",
        function()
          require("configs.dap-ui").close_dapui()
        end,
        desc = "Close debug UI",
      },
      {
        "<leader>do",
        function()
          require("configs.dap-ui").open_dapui()
        end,
        desc = "Open debug UI",
      },
    },
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    event = "User BufReadPost",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    opts = {},
  },

  {
    "folke/neodev.nvim",
    ft = { "lua" },
  },

  {
    "akinsho/flutter-tools.nvim",
    ft = { "dart" },
    config = function()
      require "configs.flutter-tools"
    end,
    keys = {
      { "<leader>fr", "<cmd>FlutterRun<CR>", desc = "Flutter run" },
      { "<leader>fq", "<cmd>FlutterQuit<CR>", desc = "Flutter quit" },
    },
    dependencies = {
      "mfussenegger/nvim-dap",
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
    opts = {
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          case_mode = "smart_case",
        },
      },
    },
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  },

  {
    "earthly/earthly.vim",
    ft = { "Earthfile" },
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
