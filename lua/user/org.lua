-- Load custom tree-sitter grammar for org filetype
require('orgmode').setup_ts_grammar()

require('orgmode').setup({
    org_agenda_files = {'~/Dropbox/org/*', '~/org/**/*'},
    org_default_notes_file = '~/Dropbox/org/notes.org',
    mappings = {
        org = {
            org_toggle_checkbox = "<leader>oc"
        }
    }
})
