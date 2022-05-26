-- Load custom tree-sitter grammar for org filetype
require('orgmode').setup_ts_grammar()

require('orgmode').setup({
    org_agenda_files = {'~/Dropbox/org/*', '~/org/**/*'},
    org_default_notes_file = '~/Dropbox/org/notes.org',
})

local org_mappings = require('orgmode.org.mappings')

-- This function will be used instead of treesitter to find links
local find_link = function ()
    return org_mappings._get_link_under_cursor()
end

local type_to_action = {
    [find_link] = "org_mappings.open_at_point",
    timestamp = "org_mappings.change_date",
    headline = "org_mappings.todo_next_state",
    listitem = "org_mappings.toggle_checkbox",
    list = "org_mappings.toggle_checkbox",
    _default = "org_mappings.open_at_point"
}

local function get_action_from_type()
    local ts_utils = require('nvim-treesitter.ts_utils')
    local cur_node = ts_utils.get_node_at_cursor()
    local cur_row = cur_node:range()


    while cur_node ~= nil do
        local nodetype = cur_node:type()

        for identifier, action in pairs(type_to_action) do
            if type(identifier) == "function" then
                if identifier() ~= nil then
                    return action
                end
            elseif nodetype == identifier and identifier ~= "_default" then
                return action
            end
        end

        cur_node = cur_node:parent()
        if cur_node == nil then
            break
        elseif cur_node:range() ~= cur_row then
            break
        end
    end

    return type_to_action._default
end

local function toggle_org_item()
    local org = require('orgmode')

    local action = get_action_from_type()

    if action ~= nil then
        org.action(action)
    end
end


   local query_module = require('vim.treesitter.query')

   local fix_indentation = function (str, min_spaces)
       if min_spaces == nil then
           min_spaces = 1000
       end

       for spaces in string.gmatch(str, "\n([ \t]+)") do
           if min_spaces > #spaces then
               min_spaces = #spaces
           end
       end

       local pattern = "\n"
       pattern = pattern .. string.rep("[ \t]", min_spaces)

       local indented = string.gsub(str, pattern, "\n")
       return indented
   end

   local save_into_files = function (files)
       for file, code_blocks in pairs(files) do
           file = io.open(file, "w+")
           io.output(file)
           for _, block in ipairs(code_blocks) do
               io.write(block .. "\n\n")
           end
           io.close(file)
       end
   end

   local get_code_from_org = function ()
       local language_tree = vim.treesitter.get_parser(0)
       local syntax_tree = language_tree:parse()
       local root = syntax_tree[1]:root()

       local get_tangled_codeblocks = vim.treesitter.parse_query( 'org', [[
           (section
               (property_drawer
                   (property
                       name: (expr) @prop_name (#eq? @prop_name "TANGLE")
                       value: (value) @file
                   )
               )
               (body
                   (block
                       contents: (contents) @code
                   )
               )
           )
       ]])

       local files = {}
       for _, captures, metadata in get_tangled_codeblocks:iter_matches(root, 0) do
           local filename = query_module.get_node_text(captures[2], 0)
           local code_text = query_module.get_node_text(captures[3], 0)
           local _, col = captures[3]:range()

           code_text = fix_indentation(code_text, col)

           if files[filename] == nil then
               files[filename] = {}
           end
           table.insert(files[filename], code_text)
       end

       save_into_files(files)
   end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "org",
    callback = function()
        vim.api.nvim_buf_set_keymap( 0, 'n', "<cr>", "", {
            callback = function ()
                toggle_org_item()
            end,
            noremap = true
        })

        vim.api.nvim_buf_set_keymap( 0, 'n', "<leader>oxt", "", {
            callback = function ()
                get_code_from_org()
            end,
            noremap = true
        })
    end
})

