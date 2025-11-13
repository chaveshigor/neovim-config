return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "leoluz/nvim-dap-go", -- Extensão específica para Go
    "rcarriga/nvim-dap-ui", -- Interface gráfica para depuração
    "theHamsta/nvim-dap-virtual-text" -- Mostrar valores inline
  },
  config = function()
    require("dapui").setup()
    require("nvim-dap-virtual-text").setup()
    require("dap-go").setup()

    local dap = require("dap")
    local dapui = require("dapui")

    -- Configuração para Go usando Delve
    dap.adapters.go = {
      type = "server",
      port = "${port}",
      executable = {
        command = "dlv",
        args = { "dap", "-l", "127.0.0.1:${port}" },
      },
    }

    dap.configurations.go = {
      {
        type = "go",
        name = "Debug",
        request = "launch",
        program = "${file}",
      },
      {
        type = "go",
        name = "Debug Package",
        request = "launch",
        program = "${workspaceFolder}",
      },
    }

    -- Ativar UI quando iniciar a depuração
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end

    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end

    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

  end
}
