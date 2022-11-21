local status, lualine = pcall(require, 'lualine')
if (not status) then return end

local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    -- sections = { "error", "warn" },
    symbols = { error = " ", warn = " ", info = " ", hint = ' ', },
    -- colored = false,
    -- update_in_insert = false,
    -- always_visible = true,
}

local diff = {
    "diff",
    colored = false,
    symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
    cond = hide_in_width,
}

local mode = {
    "mode",
    fmt = function(str)
        return "-- " .. str .. " --"
    end,
}

local filetype = {
    "filetype",
    icons_enabled = false,
    icon = nil,
}

local branch = {
    "branch",
    icons_enabled = true,
    icon = " ",
}

local location = {
    "location",
    padding = 0,
}

local filename = {
    'filename',
    file_status = true, -- displays file status
    path = 0, -- just filename
}

lualine.setup {
    options = {
        icon_enabled = true,
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = {},
        -- disabled_filetypes = { "alpha", "dashboard", "toggleterm" },
        -- globalstatus = true,
        -- always_divide_middle = true,
    },
    sections = {
        lualine_a = { mode },
        lualine_b = { branch },
        lualine_c = { filename },
        lualine_x = { diagnostics, 'encoding', filetype },
        lualine_y = { 'progress' },
        lualine_z = { location },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        -- lualine_c = { 'filename', file_status = true, path = 0 },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = { 'fugitive' },
}
