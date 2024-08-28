
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
      transparent_background = false,
      color_overrides = {
        -- latte = {
          -- rosewater = "#c98272"
        -- },
      },
      highlight_overrides = {
        -- latte = function(latte)
        --   return {
        --     NeoTreeCursorLine = {  bg = latte.surface1  },
        --   }
        -- end
        }
      })
    end
}
