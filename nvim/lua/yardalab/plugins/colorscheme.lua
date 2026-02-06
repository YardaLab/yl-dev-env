return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function(_, opts)
      require("tokyonight").setup(opts)

      vim.api.nvim_create_autocmd("VimEnter", {
        once = true,
        callback = function()
          vim.cmd.colorscheme("tokyonight")
        end,
      })
    end,
  },
}
