return {
  "AstroNvim/astrocore",
  opts = function(_, opts)
    local astro = require("astrocore")
    local options = astro.empty_map_table()

    options = {
      features = {
        autopairs = true
      },
      diagnostics = {
        virtual_text = true,
        underline = true,
      },
      options = {
        opt = {
          timeoutlen = 100,
          relativenumber = true, -- sets vim.opt.relativenumber
          number = true, -- sets vim.opt.number
          spell = false, -- sets vim.opt.spell
          signcolumn = "auto", -- sets vim.opt.signcolumn to auto
          wrap = false, -- sets vim.opt.wrap
          showtabline = 2,
        },
        g = {
          smart_case = true,
          mapleader = " ", -- sets vim.g.mapleader
          autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
          cmp_enabled = true, -- enable completion at start
          autopairs_enabled = true, -- enable autopairs at start
          diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
          icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
          ui_notifications_enabled = true, -- disable notifications when toggling UI elements
          resession_enabled = false, -- enable experimental resession.nvim session management (will be default in AstroNvim v4)
        }
      }
    }

    return astro.extend_tbl(opts, options)
  end
}

