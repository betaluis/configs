local status, telescope = pcall(require, 'telescope')
if (not status) then return end

local actions = require 'telescope.actions'

--------------- Extensions ---------------

-- telescope.load_extension('media_files')

------------------------------------------

local function telescope_buffer_dir()
    return vim.fn.expand('%:p:h')
end

-- local fb_actions = require 'telescope'.extensions.file_browser.actions
-- local media_actions = require 'telescope'.extensions.media_files.actions

telescope.setup {
    defaults = {

        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },

        mappings = {
            n = {
                ["<esc>"] = actions.close,
                ["<CR>"] = actions.select_default,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,

                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                --
                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,
                ["H"] = actions.move_to_top,
                ["M"] = actions.move_to_middle,
                ["L"] = actions.move_to_bottom,
                --
                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,
                ["gg"] = actions.move_to_top,
                ["G"] = actions.move_to_bottom,
                --
                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,

                -- ["<PageUp>"] = actions.results_scrolling_up,
                -- ["<PageDown>"] = actions.results_scrolling_down,
                --
                ["?"] = actions.which_key,
            },
            i = {
                ["<C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev,
                --
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                --
                ["<C-c>"] = actions.close,
                --
                --                ["<Down>"] = actions.move_selection_next,
                --                ["<Up>"] = actions.move_selection_previous,
                --
                ["<CR>"] = actions.select_default,
                ["<C-s>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,
                --
                -- ["<C-d>"] = require('telescope.actions').delete_buffer,
                --
                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,
                --
                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<C-l>"] = actions.complete_tag,
                ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
            }
        }
    },
    extensions = {
        -- file_browser = {
        --     theme = "dropdown",
        --     -- disables netrw add use teelscope-file-browser it its place
        --     hijack_netrw = true,
        --     mappings = {
        --         ['i'] = {
        --             ['<C-w>'] = function() vim.cmd('normal vbd') end,
        --         },
        --         ['n'] = {
        --             ['N'] = fb_actions.create,
        --             ['h'] = fb_actions.goto_parent_dir,
        --             ['/'] = function()
        --                 vim.cmd('startinsert')
        --             end
        --         }
        --     }
        -- }
        -- media_files = {
        --     filetypes = { "png", "webp", "jpg", "jpeg", "svg" },
        --     find_cmd = "rg",
        -- }
    }
}

-- telescope.load_extension('file_browser')
