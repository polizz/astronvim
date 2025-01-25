local M = {}

-- Default configuration
M.default_config = {
    prefix = "gd",
    -- Default key mappings
    mappings = {
        up = "k", -- Open definition in a horizontal split above
        right = "l", -- Open definition in a vertical split to the right
        down = "j", -- Open definition in a horizontal split below
        left = "h", -- Open definition in a vertical split to the left
        win_right = '>', -- Open def in exissting right window
        win_left = '<', -- Open def in exissting left window
    },
    -- Delay before navigating to the definition (in milliseconds)
    delay = 75,
}

local split_commands = {
    up = "split | wincmd k",         -- Horizontal split (below) and move up
    right = "vsplit",                -- Vertical split (left)
    down = "split",                  -- Horizontal split (below)
    left = "vsplit | wincmd h",      -- Vertical split (right) and move left
    win_right = "wincmd l", -- Move focus to the RIGHT window
    win_left = "wincmd h"   -- Move focus to the LEFT window
}

local descriptions = {
    up = "Show definition in a split above",
    right = "Show definition in a split right",
    down = "Show definition in a split below",
    left = "Show definition in a split left",
    win_right = "Show definition in a split right window",
    win_left = "Show definition in existing left window",
}

-- Setup function
function M.setup(user_config)
    -- Merge user configuration with defaults
    local config = vim.tbl_deep_extend("force", M.default_config, user_config or {})

    -- Define the main function
    local function goto_definition_in_direction(map_dir)
        local cmd = split_commands[map_dir]
        if not cmd then
            print("Invalid direction. Use h, j, k, l, > or <.")
            return
        end

        -- Handle existing window navigation differently
        if map_dir == "win_right" or map_dir == "win_left" then
            -- Step 1: Store current buffer
            local buffer_a = vim.api.nvim_get_current_buf()
            -- Step 2: Jump to the LSP definition (opens buffer "B" in the current pane)
            vim.lsp.buf.definition()
            -- Step 3: Record the new buffer (buffer "B")
            local buffer_b = vim.api.nvim_get_current_buf()
            -- Step 4: Move back to buffer "A" in the current pane
            vim.api.nvim_set_current_buf(buffer_a)
            -- Step 5: Move to the target pane
            vim.cmd(cmd)
            -- Step 6: Show buffer "B" in the target pane
            vim.api.nvim_set_current_buf(buffer_b)
        else
            -- Handle new split creation
            vim.cmd(cmd)
            vim.defer_fn(vim.lsp.buf.definition, config.delay)
        end
    end

    -- Set up key mappings
    for map_dir, key_dir in pairs(config.mappings) do
        vim.api.nvim_set_keymap("n", config.prefix .. key_dir, "", {
            desc = descriptions[map_dir],
            callback = function()
                goto_definition_in_direction(map_dir)
            end,
            noremap = true,
            silent = true,
        })
    end
end

return M
