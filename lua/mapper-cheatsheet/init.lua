-- plugin/keybind-cheatsheet.lua
local M = {}

-- Function to create the cheatsheet buffer and populate it
function M.show_cheatsheet()
    -- Create a new buffer
    local buf = vim.api.nvim_create_buf(false, true)

    -- Create a floating window
    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)
    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    local opts = {
        relative = 'editor',
        row = row,
        col = col,
        width = width,
        height = height,
        style = 'minimal',
        border = 'rounded'
    }

    local win = vim.api.nvim_open_win(buf, true, opts)

    -- Function to format keybindings into displayable text
    local function format_keybindings(bindings)
        local lines = {}

        for category, modes in pairs(bindings) do
            table.insert(lines, string.format("# %s", category:upper()))
            table.insert(lines, "")

            for mode, keybinds in pairs(modes) do
                table.insert(lines, string.format("## Mode: %s", mode))
                table.insert(lines, "")

                -- Calculate column widths
                local key_width = 15
                local desc_width = width - key_width - 10

                -- Header
                table.insert(lines, string.format("%-" .. key_width .. "s %s",
                    "Keybind", "Description"))
                table.insert(lines, string.rep("-", width - 10))

                for key, info in pairs(keybinds) do
                    local description = info[2]
                    table.insert(lines, string.format("%-" .. key_width .. "s %s",
                        key, description))
                end

                table.insert(lines, "")
            end

            table.insert(lines, string.rep("-", width - 10))
            table.insert(lines, "")
        end

        return lines
    end

    -- Set buffer content
    local lines = format_keybindings(M.keybindings)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

    -- Set buffer options
    vim.api.nvim_buf_set_option(buf, 'modifiable', false)
    vim.api.nvim_buf_set_option(buf, 'filetype', 'markdown')

    -- Set buffer mappings
    local close_keys = { 'q', '<Esc>' }
    for _, key in ipairs(close_keys) do
        vim.api.nvim_buf_set_keymap(buf, 'n', key, ':close<CR>',
            { silent = true, noremap = true })
    end

    -- Set window options
    vim.api.nvim_win_set_option(win, 'wrap', false)
    vim.api.nvim_win_set_option(win, 'cursorline', true)

    return buf, win
end

-- Function to set up the plugin
function M.setup(config)
    M.keybindings = config or {}
end

return M
