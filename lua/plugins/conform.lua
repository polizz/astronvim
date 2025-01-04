return {
  enabled = false,
  "stevearc/conform.nvim",
  -- opts = {},
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        -- You can customize some of the format options for the filetype (:help conform.format)
        markdown = { "markdownfmt" },
        -- Conform will run the first available formatter
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
      },
    })
    end
}
