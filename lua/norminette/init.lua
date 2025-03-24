local M = {}

local namespace = vim.api.nvim_create_namespace("norminette")

function M.setup()
  vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("norminette", { clear = true }),
    pattern = { "*.c", "*.h" },
    callback = function()
      -- ignore current buffer if starts with "// @ignore norm"
      local first_line = table.concat(vim.api.nvim_buf_get_lines(0, 0, 1, false))
      if first_line == nil or first_line == "// @ignore norm" then
        vim.diagnostic.reset(namespace, 0)
        return
      end

      local filename = vim.fn.expand("%")
      vim.fn.jobstart({ "norminette", filename }, {
        stdout_buffered = true,
        on_stdout = function(_, data)
          vim.diagnostic.reset(namespace, 0)

          local diagnostics = {}

          for _, line in ipairs(data) do
            if line ~= "" then
              local lnum = tonumber(string.match(line, "line:%s*(%d+)"))

              -- there is a bug that whenever there are tabstop
              -- they are counted into the column but not in the diagnostics
              -- so we disable this part
              -- local lcol = tonumber(string.match(line, "col:%s*(%d+)"))

              -- if no line is found, ignore
              if lnum == nil then
                goto continue
              end

              table.insert(diagnostics, {
                bufnr = 0,
                lnum = lnum - 1,
                col = 0, -- lcol - 1,
                severity = vim.diagnostic.severity.WARN,
                source = "norminette",
                message = line,
              })

              ::continue::
            end
          end

          vim.diagnostic.set(namespace, 0, diagnostics)
        end,
        on_stderr = function(_, data)
          if data then
            for _, line in ipairs(data) do
              if line and line ~= "" then
                vim.notify(line, vim.log.levels.ERROR)
              end
            end
          end
        end,
      })
    end,
  })
end

return M
