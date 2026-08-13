return {
  "linux-cultist/venv-selector.nvim",
  opts = {
    options = {
      statusline_func = {
        lualine = function()
          local venv = require("venv-selector").venv()
          if venv and venv ~= "" then
            -- Strips full path and displays icon + folder name (e.g., " .venv")
            return "snake " .. vim.fn.fnamemodify(venv, ":t")
          end
          return ""
        end,
      },
    },
  },
}
