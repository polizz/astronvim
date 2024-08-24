
return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  -- opts = {
  --     transparent_background = true,
  --     integrations = {
  --       telescope = true,
  --       harpoon = true
  --   }},
  config = function()
    require("catppuccin").setup({
      highlight_overrides = {
        latte = function(latte)
          return {
            NeoTreeCursorLine = {  bg = latte.surface0  },
          }
        end
        }
      })
    end
}
