return {
  {
    dir = "~/.config/nvim/lua/norminette",
    ft = { "c", "h" },
    config = function()
      package.loaded["norminette"] = nil
      require("norminette").setup()
    end,
  },
}
