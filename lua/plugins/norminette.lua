return {
  {
    dir = "~/.config/nvim/lua/norminette",
    ft = { "c", "cpp" },
    config = function()
      local filetype = vim.bo.filetype
      local filename = vim.fn.expand("%:t") -- Get the filename

      -- Only allow if it's a C file or a .h file
      if filetype ~= "c" and not filename:match("%.h$") then
        return
      end

      package.loaded["norminette"] = nil
      require("norminette").setup()
    end,
  },
}
