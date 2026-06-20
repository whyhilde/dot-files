local function setup_debugger()
  require("dap").adapters.delve = {
    type = "server",
    port = "${port}",
    executable = {
      command = "dlv",
      args = {
        "dap",
        "-l",
        "127.0.0.1:${port}",
      },
    },
  }

  require("dap").configurations.go = {
    {
      type = "delve",
      name = "debug",
      request = "launch",
      program = "${file}",
    },
    {
      type = "delve",
      name = "debug package",
      request = "launch",
      program = "${workspaceFolder}",
    },
  }
end
