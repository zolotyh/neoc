-----------------------------------------------------------
-- Treesitter configuration file
----------------------------------------------------------
-- Plugin: nvim-treesitter
-- url: https://github.com/nvim-treesitter/nvim-treesitter
require('nvim-treesitter.configs').setup {
    autotag = {enable = true},
    pairs = {
        enable = true,
        disable = {},
        highlight_pair_events = {}, -- e.g. {"CursorMoved"}, -- when to highlight the pairs, use {} to deactivate highlighting
        highlight_self = false, -- whether to highlight also the part of the pair under cursor (or only the partner)
        goto_right_end = false, -- whether to go to the end of the right partner or the beginning
        fallback_cmd_normal = "call matchit#Match_wrapper('',1,'n')", -- What command to issue when we can't find a pair (e.g. "normal! %")
        keymaps = {goto_partner = "<leader>%", delete_balanced = "X"},
        delete_balanced = {
            only_on_first_char = false, -- whether to trigger balanced delete when on first character of a pair
            fallback_cmd_normal = nil, -- fallback command when no pair found, can be nil
            longest_partner = false -- whether to delete the longest or the shortest pair when multiple found.
            -- E.g. whether to delete the angle bracket or whole tag in  <pair> </pair>
        }
    },
    refactor = {
        highlight_definitions = {
            enable = true,
            -- Set to false if you have an `updatetime` of ~100.
            clear_on_cursor_move = true
        }
    },
    -- END windwp/nvim-ts-autotag

    highlight = {enable = true, disable = {}},
    indent = {enable = true, disable = {}},
    ensure_installed = {"tsx", "javascript", "typescript", "json", "html", "css", "scss", "vim", "lua"},
    additional_vim_regex_highlighting = true,
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false
    }
}
