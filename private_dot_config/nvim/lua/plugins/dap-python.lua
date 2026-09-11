return {
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      local dap = require("dap")
      local dap_python = require("dap-python")
      -- Install debugpy on venv eg. uv pip install debugpy
      -- Run process with debugpy and exposed debug port
      -- eg uv run python -m debugpy --listen 5678 --wait-for-client manage.py runserver
      -- Initialize dap-python runner
      local venv = os.getenv("VIRTUAL_ENV")
      local python_path = venv and (venv .. "/bin/python") or "python"
      dap_python.setup(python_path)

      -- Hardcode the ONLY debug target to Attach
      dap.configurations.python = {
        {
          type = "python",
          request = "attach",
          name = "Attach to Running App (5678)",
          connect = {
            host = "127.0.0.1",
            port = 5678,
          },
        },
      }
    end,
  },
}
