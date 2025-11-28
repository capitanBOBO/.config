return {
  "mfussenegger/nvim-dap",
  opts = function(_, opts)
    local dap = require("dap")

    -------------------------------------------------------------------
    -- Adapter
    -------------------------------------------------------------------
    dap.adapters.dart = {
      type = "executable",
      command = "flutter",
      args = { "debug_adapter" },
    }
    -------------------------------------------------------------------
    -- Make sure configurations table exists
    -------------------------------------------------------------------
    opts.configurations = opts.configurations or {}
    opts.configurations.dart = opts.configurations.dart or {}

    table.insert(opts.configurations.dart, {
        type = "dart",
        request = "launch",
        name = "Flutter Debug",
        program = "lib/main.dart",
        cwd = vim.fn.getcwd(),

        -- disable stopping on exceptions
        exceptionBreaks = "None",

        -- ask device each time
        toolArgs = function()
          local dev = vim.fn.input("Device ID (optional): ")
          if dev ~= "" then
            return { "--device-id=" .. dev }
          end
          return {}
        end,
      })
  end,
}
