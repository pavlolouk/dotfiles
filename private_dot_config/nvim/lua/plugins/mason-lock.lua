return {
  "zapling/mason-lock.nvim",
  event = "VeryLazy",
  opts = {
    lockfile_path = vim.fn.stdpath("config") .. "/mason-lock.json",
  },
}
