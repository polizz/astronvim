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
    },
    -- Delay before navigating to the definition (in milliseconds)
    delay = 75,
}

local split_commands = {
    up = "split | wincmd k",  -- Horizontal split (below) and move up
    right = "vsplit",            -- Vertical split (left)
    down = "split",             -- Horizontal split (below)
    left = "vsplit | wincmd h", -- Vertical split (right) and move left
}

local descriptions = {
    up = "Show definition in a split above",
    right = "Show definition in a split right",
    down = "Show definition in a split below",
    left = "Show definition in a split left",
}

-- Setup function
function M.setup(user_config)
    -- Merge user configuration with defaults
    local config = vim.tbl_deep_extend("force", M.default_config, user_config or {})

    -- Define the main function
    local function goto_definition_in_direction(map_dir)
        local cmd = split_commands[map_dir]
        if not cmd then
            print("Invalid direction. Use h, j, k, or l.")
            return
        end
        vim.cmd(cmd)

        -- Go to the definition in the new window after a short delay
        vim.defer_fn(vim.lsp.buf.definition, config.delay)
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
