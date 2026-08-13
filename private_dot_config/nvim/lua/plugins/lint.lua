return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          -- args = { "-", "--config", vim.fn.stdpath("config") .. "/.markdownlint-cli2.yaml", "--" },
          prepend_args = { "--config", vim.fn.stdpath("config") .. "/.markdownlint-cli2.yaml", "--" },
        },
      },
    },
  },
}
