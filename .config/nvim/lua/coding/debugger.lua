return {
  "mfussenegger/nvim-dap",
  event = {
    "BufReadPost",
    "BufNewFile",
    "BufNew",
  },
  dependencies = {
    "nvim-neotest/nvim-nio",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local virtualtext = require("nvim-dap-virtual-text")
    local data = vim.fn.stdpath("data")


    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = data .. "/mason/packages/codelldb/extension/adapter/codelldb",
        args = {
          "--port",
          "${port}",
        },
      },
    }


    dap.configurations.cpp = {
      {
        name = "launch file",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input("path to executable", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
        runInTerminal = false,
      },
      {
        name = "attach to process",
        type = "codelldb",
        request = "attach",
        pid = require("dap.utils").pick_process,
        args = {},
      },
    }


    vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint" })
    vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DapBreakpointCondition" })
    vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapLogPoint" })
    vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped" })
    vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DapBreakpointRejected" })


    dapui.setup {
      layouts = {
        {
          elements = {
            { id = "scopes", size = 0.3, },
            { id = "watches", size = 0.3, },
            { id = "stacks", size = 0.3, },
          },
          size = 0.3,
          position = "right",
        },
        {
          elements = {
            { id = "console", size = 0.55, },
            { id = "repl", size = 0.45, },
          },
          position = "bottom",
          size = 0.25,
        },
      },
      icons = {
        expanded = " ",
        collapsed = " ",
        current_frame = " ",
      },
      controls = {
        icons = require("icons").debugger,
      },
    }


    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open { reset = true, }
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close {}
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close {}
    end


    virtualtext.setup {
      enabled = true,
      enabled_commands = true,
      highlight_changed_variables = true,
      highlight_new_as_changed = true,
      show_stop_reason = true,
      commented = false,
      only_first_definition = true,
      all_references = false,
      virt_lines = false,
      virt_text_pos = "eol",
      virt_text_win_col = nil,
      text_prefix = "* ",
    }
  end,
  keys = {
    {
      mode = "n",
      "<F5>",
      function() require("dap").continue() end,
    },
    {
      mode = "n",
      "<F10>",
      function() require("dap").step_over() end,
    },
    {
      mode = "n",
      "<F11>",
      function() require("dap").step_into() end,
    },
    {
      mode = "n",
      "<F12>",
      function() require("dap").step_out() end,
    },
    {
      mode = "n",
      "<leader>b",
      function() require("dap").toggle_breakpoint() end,
    },
    {
      mode = "n",
      "<leader>B",
      function() require("dap").set_breakpoint(vim.fn.input("breakpoint condition: ")) end,
    },
    {
      mode = "n",
      "<leader>lp",
      function() require("dap").set_breakpoint(nil, nil, vim.fn.input("log point message: ")) end,
    },
    {
      mode = "n",
      "<leader>dr",
      function() require("dap").repl.open() end,
    },
    {
      mode = "n",
      "<leader>dl",
      function() require("dap").run_last() end,
    },
    {
      mode = "n",
      "<leader>du",
      function() require("dapui").toggle() end,
    },
  },
}
