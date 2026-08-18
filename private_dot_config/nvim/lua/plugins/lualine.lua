return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    -- Insert the venv-selector statusline into section lualine_x
    table.insert(opts.sections.lualine_x, {
      function()
        local venv_name = ""
        -- 1. Check VIRTUAL_ENV_PROMPT
        if vim.env.VIRTUAL_ENV_PROMPT and vim.env.VIRTUAL_ENV_PROMPT ~= "" then
          venv_name = vim.env.VIRTUAL_ENV_PROMPT
        end

        -- 2. Try venv-selector if loaded and prompt was not set
        if venv_name == "" then
          local ok, venv_selector = pcall(require, "venv-selector")
          if ok and type(venv_selector.venv) == "function" then
            local selected = venv_selector.venv()
            if selected and selected ~= "" then
              venv_name = vim.fn.fnamemodify(selected, ":h:t")
            end
          end
        end

        -- 3. Fallback to standard VIRTUAL_ENV
        if venv_name == "" then
          local active_env = vim.env.VIRTUAL_ENV
          if active_env then
            venv_name = vim.fn.fnamemodify(active_env, ":t")
          end
        end

        -- Return formatted icon + string if resolved
        if venv_name ~= "" then
          return " " .. venv_name
        end

        return ""
      end,
      cond = function()
        -- Only display the component when looking at Python buffers
        return vim.bo.filetype == "python"
      end,
    })
    -- Custom branch component with 8-character limit
    local short_branch = {
      "branch",
      fmt = function(name)
        if #name > 8 then
          return name:sub(1, 8) .. "…" -- Truncates to 8 chars with an ellipsis
        end
        return name
      end,
    }
    -- Replace or insert into `lualine_b` (where branch usually resides)
    opts.sections.lualine_b = { short_branch }
  end,
}
