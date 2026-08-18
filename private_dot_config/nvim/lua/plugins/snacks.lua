return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        grep = {
          args = { "-F" },
        },
        explorer = {
          hidden = true,
          ignored = true,
          exclude = {
            "**/.git",
            "**/.config",
            "**/__pycache__",
            "**/.mypy_cache",
            "**/.ruff_cache",
            "**/node_modules",
            "**/.venv",
          },
        },
      },
    },
  },
}
