return {
  "AstroNvim/astroui",
  opts = {
    folding = {
      enabled = true,
      methods = { "treesitter", "lsp" , "indent" },
    },
    colorscheme = "ayu-dark",
    highlights = {
      -- ["ayu-dark"] = {
      --   LineNr = { fg = "#555555" },
      -- },
      init = {
        LineNr = { fg = "#555555" },
      }
    }
  }
}
