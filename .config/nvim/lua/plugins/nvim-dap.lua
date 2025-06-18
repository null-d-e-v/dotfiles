return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require "dap"

    dap.configurations.typescript = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Run dev project",
        cwd = "${workspaceFolder}",
        runtimeExecutable = "bun",
        runtimeArgs = { "run", "dev" },
      },
    }
  end,
}
